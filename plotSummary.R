library(nlme) # lme
library(lme4) # lmer
library(xlsx) # read.xlsx
library(tidyr) # gather
library(dplyr) # recode
library(ggplot2) # ggplot

gerbil = 'HE-All'
# gerbil = 'HE-CMR05Fluffy'
# gerbil = 'HE-CMR05Tail'
# gerbil = 'HE-D2Right'
# gerbil = 'HE-E1Right'
# 
gerbil = 'LE-All'
# gerbil = 'LE-CMR08Head'
# gerbil = 'LE-CMR08Tail'

# for (gerbil in c('HE-All', 'HE-CMR05Fluffy', 'HE-CMR05Tail','HE-D2Right', 'HE-E1Right', 'LE-All', 'LE-CMR08Tail', 'LE-CMR08Head')) {

summaryFile = paste('results/Summary-', gerbil, '-Sorted.xlsx', sep='')

save_plot = function(plot, file) {
  # ggsave(plot, file=file, height=4, width=6, dpi=600)
}

# ggplot config
dg = 0
err_width = .2
theme_my = theme_classic() +
  theme(plot.title=element_text(hjust=0.5))  # align title to center
grid_x = theme(panel.grid.major.x=element_line('grey85', .25, 'dashed'))
grid_y = theme(panel.grid.major.y=element_line('grey85', .25, 'dashed'))
grid_xy = grid_x + grid_y
# no_grid_y = theme(panel.grid.major.y=element_blank(),
#                   panel.grid.minor.y=element_blank())
expand_x = scale_x_discrete(expand=expansion(mult=c(.2,.2)))
expand_y = scale_y_continuous(expand=expansion(mult=c(.1,.1)))
expand_y0 = scale_y_continuous(expand=expansion(mult=c(0,.1)))
no_expand_x = scale_x_discrete(expand=expansion(mult=c(0,0)))
no_expand_y = scale_y_continuous(expand=expansion(mult=c(0,0)))

linetypes = c('solid', '11')
shapes = c(16, 1)
# active vs passive colors
colors = c(rgb(0.9137,0.3882,0.4039), rgb(.3,.3,.3))
color_manual = scale_color_manual(values=colors)
fill_manual = scale_fill_manual(values=colors)

mean_point = stat_summary(fun=mean, geom='point', size=3.5, #stroke=1.75,
                          position=position_dodge(width=dg))
mean_line = stat_summary(fun=mean, geom='line', size=1.5,
                         position=position_dodge(width=dg))
se_errorbar = stat_summary(fun.data=mean_se, geom='errorbar', #linetype='solid',
                           width=err_width, size=1.5, position=position_dodge(width=dg))

#################
# target evoked response

# for (dp in c(.2, .3, .4, .42, .45, .5)) {
# summaryFile = paste('results/Summary-', gerbil, '-Sorted-dp', dp, '.xlsx', sep='')

gc()
data = read.xlsx(summaryFile, 'DeltaPSTH')
data2 = subset(data, Score=='All')
data2$SubjectID = factor(data2$SubjectID)
data2$UnitID = factor(data2$UnitID)
data2$SNR = factor(data2$TargetLevel-50)
data2$SNRn = data2$TargetLevel-50
data2$DeltaPSTH = data2$DeltaPSTH * 100   # as percentage


# unit category count
data2 %>%
  group_by(SubjectID, Category) %>%
  summarize(Count=n_distinct(UnitID)) %>%
  print

# unit sub-category count
data2 %>%
  subset(SubCategory!='None') %>%
  group_by(SubjectID, SubCategory) %>%
  summarize(Count=n_distinct(UnitID)) %>%
  print

summary(subset(data2, SubCategory=='Phasic Enhancing', select=c(SubjectID, UnitID)))

model = aov(DeltaPSTH ~ SNR*Mode*SubCategory + Error(factor(UnitID)), subset(data2, Category=='Phasic'))
summary(model)

model2 = lm(DeltaPSTH ~ 1 + SNRn*Mode, subset(data2, Category=='Phasic'))
summary(model2)

labs_xy = labs(x='SNR [dB]', y='Sound-evoked response [%]')
xintercept = geom_vline(xintercept=2, color='grey85', size=.25, linetype='dashed')
yintercept = geom_hline(yintercept=0, color='grey85', size=.25, linetype='dashed')
ylim = coord_cartesian(ylim=c(-30,30))

# ggplot(data2, aes(x=SNR, y=DeltaPSTH, color=Mode, shape=Category)) +
#   geom_point(size=2, position=position_dodge(width=dg)) +
#   labs_xy + labs(color='Mode') +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=DeltaPSTH, color=Mode, shape=Category)) +
#   se_errorbar + mean_point +
#   labs_xy + labs(color='Mode') +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=DeltaPSTH, shape=Category)) +
#   se_errorbar + mean_point +
#   labs_xy +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=DeltaPSTH, color=Mode)) +
#   se_errorbar + mean_point +
#   labs_xy + labs(color='Mode') +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=DeltaPSTH)) +
#   se_errorbar + mean_point +
#   labs_xy +
#   theme_my

# title = paste('Phasic Units ', length(unique(subset(data2, Category=='Phasic')$UnitID)), ' (dp > ', dp, ')')

p = ggplot(subset(data2, Category=='Phasic'),
           aes(x=SNR, y=DeltaPSTH, color=Mode, group=Mode)) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Units') +
  color_manual +
  ylim + expand_x + expand_y +
  theme_my
print(p)
save_plot(p, file=paste('figs/Summary/delta-phasic-', gerbil, '.svg', sep=''))

# }

p = ggplot(subset(data2, SubCategory=='Phasic Enhancing'),
           aes(x=SNR, y=DeltaPSTH, color=Mode, group=Mode)) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Enhancing Units') +
  color_manual +
  ylim + expand_x + expand_y +
  theme_my
print(p)
save_plot(p, file=paste('figs/Summary/delta-phasic-enhancing-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, SubCategory=='Phasic Suppressing'),
           aes(x=SNR, y=DeltaPSTH, color=Mode, group=Mode)) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Suppressing Units') +
  color_manual +
  ylim + expand_x + expand_y +
  theme_my
print(p)
save_plot(p, file=paste('figs/Summary/delta-phasic-suppressing-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, SubCategory=='Phasic No Change'),
           aes(x=SNR, y=DeltaPSTH, color=Mode, group=Mode)) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic No Change Units') +
  color_manual +
  ylim + expand_x + expand_y +
  theme_my
print(p)
save_plot(p, file=paste('figs/Summary/delta-phasic-nochange-', gerbil, '.svg', sep=''))


p = ggplot(subset(data2, Category=='Tonic'),
           aes(x=SNR, y=DeltaPSTH, color=Mode, group=Mode)) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Tonic units') +
  color_manual +
  ylim + expand_x + expand_y +
  theme_my
p
save_plot(p, file=paste('figs/Summary/delta-tonic-', gerbil, '.svg', sep=''))


#################
# vector strength

# for (dp in c(.2, .3, .4, .42, .45, .5)) {
# summaryFile = paste('results/Summary-', gerbil, '-Sorted-dp', dp, '.xlsx', sep='')
  
gc()
data = read.xlsx(summaryFile, 'VectorStrength')
data2 = subset(data, Score=='All' & Category=='Phasic')
data2$Bin = factor(data2$Bin, c('Pre','Peri','Post'), 1:3)
# as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
# data2$Bin = as.numeric.factor(data2$Bin)
data2$SNR = factor(data2$TargetLevel-50, c(-50,-10,0,10), c('Nogo', -10, 0, 10))

model1 = lme(VectorStrength ~ SNR*Mode*Bin, data2, random= ~ 1 | UnitID)
summary(model1)
anova(model1)

model2 = aov(VectorStrength ~ SNR*Mode*Bin + Error(UnitID), subset(data2))
summary(model2)

labs_xy = labs(x='SNR [dB]', y='Vector strength')
ylim = coord_cartesian(ylim=c(0,.45))

# ggplot(data2, aes(x=SNR, y=VectorStrength, color=Mode, shape=Bin)) +
#   geom_point(size=2, position=position_dodge(width=dg)) +
#   labs_xy + labs(color='Mode') +
#   theme_my
# 
# ggplot(data2, aes(x=SNR, y=VectorStrength, color=Mode, shape=Bin)) +
#   se_errorbar + mean_point +
#   labs_xy + labs(color='Mode') +
#   theme_my
# 
# ggplot(data2, aes(x=SNR, y=VectorStrength, shape=Bin)) +
#   se_errorbar + mean_point +
#   labs_xy +
#   theme_my

# p = ggplot(data2, aes(x=SNR, y=VectorStrength, color=Mode, group=Mode)) +
#   se_errorbar + mean_line + mean_point +
#   labs_xy + labs(color='Mode', title='Phasic units') +
#   coord_cartesian(ylim=c(0,.6)) +
#   theme_my
# p
# save_plot(p, file=paste('figs/Summary/VSavg2-', gerbil, '.svg', sep=''))

# title = paste('Phasic Units ', length(unique(subset(data2)$UnitID)), ' (dp > ', dp, ')')

p = ggplot(subset(data2, Bin==2),
           aes(x=SNR, y=VectorStrength, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-', gerbil, '.svg', sep=''))

# }

p = ggplot(subset(data2, Bin==2 & SubCategory=='Phasic Enhancing'),
           aes(x=SNR, y=VectorStrength, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Enhancing Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-enhancing-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, Bin==2 & SubCategory=='Phasic Suppressing'),
           aes(x=SNR, y=VectorStrength, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Suppressing Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-suppressing-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, Bin==2 & SubCategory=='Phasic No Change'),
           aes(x=SNR, y=VectorStrength, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic No Change Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-nochange-', gerbil, '.svg', sep=''))


# violin plot
p = ggplot(subset(data2, Bin==2),
           aes(x=SNR, y=VectorStrength, fill=Mode)) +
  geom_violin(position=position_dodge(.5), alpha=.9, width=.8) +
  labs_xy + labs(fill='Mode', title='Phasic units') +
  fill_manual +
  coord_cartesian(ylim=c(0,NaN)) +
  expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/VSperi3-', gerbil, '.svg', sep=''))

# ggplot(data2, aes(x=SNR, y=VectorStrength)) +
#   se_errorbar + mean_point +
#   labs_xy +
#   theme_my


#################
# d prime

gc()
data = read.xlsx(summaryFile, 'dPrime')
data2 = subset(data, Score=='All' & Bin=='Peri', select=-c(Score, Bin))
data2$SNR = factor(data2$TargetLevel-50)

# model = aov(dPrime ~ SNR*Mode + Error(UnitID), subset(data2, Category=='Phasic'))
# summary(model)
# 
# model = aov(dPrime ~ SNR*Mode + Error(UnitID), subset(data2, Category=='Tonic'))
# summary(model)
# 
# model = aov(dPrime ~ SNR*Mode*Category + Error(UnitID), data2)
# summary(model)

# data3 = data2 %>%
#   group_by_at(vars(-c(dPrime))) %>%
#   summarize(dPrime=sqrt(mean(dPrime^2)))

labs_xy = labs(x='SNR [dB]', y='d\'')
ylim = coord_cartesian(ylim=c(0,.39999))

p = ggplot(subset(data2, Category=='Phasic'),
           aes(x=SNR, y=dPrime, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/dp-phasic-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, SubCategory=='Phasic Enhancing'),
           aes(x=SNR, y=dPrime, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Enhancing units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/dp-phasic-enhancing-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, SubCategory=='Phasic Suppressing'),
           aes(x=SNR, y=dPrime, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Suppressing units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/dp-phasic-suppressing-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, SubCategory=='Phasic No Change'),
           aes(x=SNR, y=dPrime, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic No Change units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/dp-phasic-nochange-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, Category=='Tonic'),
           aes(x=SNR, y=dPrime, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  color_manual +
  scale_alpha(guide='none') +
  labs_xy + labs(color='Mode', title='Tonic units') +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/dp-tonic-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2),
           aes(x=SNR, y=dPrime, color=Mode,
               # alpha=Category,
               shape=Category,linetype=Category,
               group=interaction(Mode, Category))) +
  se_errorbar + mean_line + mean_point +
  scale_linetype_manual(values=linetypes) +
  scale_shape_manual(values=shapes) +
  color_manual +
  # scale_alpha_manual(values=c(1, .5)) +
  labs_xy + labs(color='Mode', title='Phasic and tonic units') +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/dp-', gerbil, '.svg', sep=''))

# }
