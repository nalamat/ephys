library(lme4) # lme
library(xlsx) # read.xlsx
library(tidyr) # gather
library(dplyr) # recode
library(ggplot2) # ggplot

save_plot = function(plot, file) {
  ggsave(plot, file=file, height=4, width=6, dpi=600)
}

#### Load ####

rove = 'TargetDuration'; label = 'Target duration (s)'
# rove = 'TargetLevel'; label = 'SNR (dB)'

data = read.xlsx(sprintf('AnalysisNJIT/Behavior-%s.xlsx', rove), 1)

data2 = subset(data, !is.na(ResponseDuration) & ResponseDuration<10)
data2$Score = recode(data2$Score, HIT='HIT+FA', FA='HIT+FA',
                     MISS='MISS+CR', CR='MISS+CR')
if (rove == 'TargetLevel')
  data2$Rove = factor(data2$TargetLevel-50, labels=c('Nogo', '-10', '0', '+10'))
if (rove == 'TargetDuration')
  data2$Rove = data2$TargetDuration

# combine different scores
erfinv <- function(x) qnorm((1 + x)/2)/sqrt(2)
clip <- function(x) max(.05, min(.95, x))
zScore <- function(x) erfinv(1-2*(1-clip(x)))*sqrt(2)
data3 = data2 %>%
  group_by_at(vars(-c(ResponseDuration, Score))) %>%
  summarise(ResponseDuration=mean(ResponseDuration),
            HitRate=mean(Score=='HIT+FA'),
            zScore=zScore(HitRate),
            dPrime=NaN)


for (session in unique(data3$Session)) {
  zScoreNogo = subset(data3, Session==session & Rove==0)$zScore
  for (rove in unique(data3$Rove)) {
    zScoreGo = subset(data3, Session==session & Rove==rove)$zScore
    dPrime = zScoreGo - zScoreNogo
    data3[data3$Session==session & data3$Rove==rove,]$dPrime = dPrime
  }
}

# group different scores
data4 = data2 %>%
  group_by_at(vars(-c(ResponseDuration))) %>%
  summarise(ResponseDuration=mean(ResponseDuration))


#### Model ####

gerbils = length(unique(data2$Subject))
sessions = length(unique(data2$Session))

# model response duration
# model1 = lme(ResponseDuration ~ SNR * Score, random= ~ 1 | Subject / Session,
#             subset(data2)) #, SNR != 'Nogo'))
model1 = lmer(ResponseDuration ~ Rove*Score + (1 | Subject / Session),
             subset(data2)) #, Rove != 'Nogo'))
summary(model1)

coefs = data.frame(coef(summary(model1)))
coefs$p.value <- 2 * (1 - pnorm(abs(coefs$t.value)))
coefs


model2 = glmer(Score ~ Rove + (1 | Subject / Session),
               data2, family=binomial(link=logit))
summary(model2)
data2$ScoreVal = as.numeric(data2$Score)-1
data2$ScoreFit = fitted(model2)


#### Plot ####

errwidth = if (rove=='TargetDuration') .05 else .2
title = paste(gerbils, 'gerbils,', sessions, 'sessions')
theme_my = theme_bw() + theme(plot.title=element_text(hjust=0.5)) # Center title
mean_point = stat_summary(fun.y=mean, geom='point', size=3)
mean_line = stat_summary(fun.y=mean, geom='line', size=1.5)
mean_bar = stat_summary(fun.y=mean, geom='bar', size=.8)
se_errorbar = stat_summary(fun.data=mean_se, geom='errorbar',
                           width=errwidth, size=1.5)
data3$ResponseDuration2 = data3$ResponseDuration - data3$Rove
data4$ResponseDuration2 = data4$ResponseDuration - data4$Rove

p = ggplot(data3, aes(x=Rove, y=ResponseDuration2, group=1)) +
  se_errorbar + mean_line + mean_point +
  labs(x=label, y='Response duration', title=title) +
  theme_my
save_plot(p, file='figs/Temporal-Integration/temporal-integration-response-all.svg')
p = ggplot(data3, aes(x=Rove, y=ResponseDuration2, color=Subject)) +
  se_errorbar + mean_line + mean_point +
  labs(x=label, y='Response duration', title=title) +
  theme_my
save_plot(p, file='figs/Temporal-Integration/temporal-integration-response-each.svg')

ggplot(data4, aes(x=Rove, y=ResponseDuration2, color=Score, group=Score)) +
  se_errorbar + mean_line + mean_point +
  labs(x=label, y='Response duration', title=title) +
  theme_my

# Hit rate
p = ggplot(subset(data3, Rove>0), aes(x=Rove, y=HitRate)) +
  se_errorbar + mean_line + mean_point +
  labs(x=label, y='Hit rate', title=title) +
  coord_cartesian(ylim=c(0,1)) +
  theme_my
p
save_plot(p, file='figs/Temporal-Integration/temporal-integration-hitrate-all.svg')

p = ggplot(subset(data3, Rove>0), aes(x=Rove, y=HitRate, color=Subject)) +
  se_errorbar + mean_line + mean_point +
  labs(x=label, y='Hit rate', title=title) +
  coord_cartesian(ylim=c(0,1)) +
  theme_my
p
save_plot(p, file='figs/Temporal-Integration/temporal-integration-hitrate-each.svg')

# Behavioral d'
p = ggplot(subset(data3, Rove>0), aes(x=Rove, y=dPrime)) +
  se_errorbar + mean_line + mean_point +
  labs(x=label, y='Behavioral d\'', title=title) +
  coord_cartesian(ylim=c(0,2.25)) +
  theme_my
p
save_plot(p, file='figs/Temporal-Integration/temporal-integration-dprime-all.svg')

p = ggplot(subset(data3, Rove>0), aes(x=Rove, y=dPrime, color=Subject)) +
  se_errorbar + mean_line + mean_point +
  labs(x=label, y='Behavioral d\'', title=title) +
  coord_cartesian(ylim=c(0,2.25)) +
  theme_my
p
save_plot(p, file='figs/Temporal-Integration/temporal-integration-dprime-each.svg')

ggplot(data2, aes(x=Rove)) +
  stat_summary(aes(y=ScoreFit, group=1), fun.data=mean_se, geom='ribbon',
               color=NA, fill='blue3', alpha=.5) +
  stat_summary(aes(y=ScoreFit, group=1), fun.y=mean, geom='line', size=1.5,
               color='blue3') +
  stat_summary(aes(y=ScoreVal), fun.data=mean_se, geom='errorbar',
               width=errwidth, size=1.5, color='red3') +
  stat_summary(aes(y=ScoreVal), fun.y=mean, geom='point', size=3,
               color='red3') +
  labs(x=label, y='Score', title=title) +
  theme_my
