library(nlme) # lme
library(lme4) # lmer
library(xlsx) # read.xlsx
library(tidyr) # gather
library(dplyr) # recode
library(ggplot2) # ggplot

# gerbil = 'HE-All'
# gerbil = 'HE-CMR05Fluffy'
# gerbil = 'HE-CMR05Tail'
# gerbil = 'HE-D2Right'
# gerbil = 'HE-E1Right'
#
# gerbil = 'LE-All'
# gerbil = 'LE-CMR08Head'
# gerbil = 'LE-CMR08Tail'

# for (gerbil in c('HE-All', 'HE-CMR05Fluffy', 'HE-CMR05Tail','HE-D2Right',
#   'HE-E1Right', 'LE-All', 'LE-CMR08Tail', 'LE-CMR08Head')) {

# summaryFile = paste('results/Summary-', gerbil, '-Sorted.xlsx', sep='')

summaryFileHE = 'results/Summary-HE-All-Sorted.xlsx'
summaryFileLE = 'results/Summary-LE-All-Sorted.xlsx'

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
                          # position=position_dodge(width=dg)
                          )
mean_line = stat_summary(fun=mean, geom='line', size=1.5,
                         # position=position_dodge(width=dg)
                         )
se_errorbar = stat_summary(fun.data=mean_se, geom='errorbar', #linetype='solid',
                           width=err_width, size=1.5,
                           # position=position_dodge(width=dg)
                           )

#################
# target-evoked response

# for (dp in c(.2, .3, .4, .42, .45, .5)) {
# summaryFile = paste('results/Summary-', gerbil, '-Sorted-dp', dp, '.xlsx', sep='')

gc()
# data = read.xlsx(summaryFile, 'Intervals')
dataHE = read.xlsx(summaryFileHE, 'Intervals')
dataHE$Effort = 'HE'
dataLE = read.xlsx(summaryFileLE, 'Intervals')
dataLE$Effort = 'LE'
data = rbind(dataHE, dataLE)

data2 = subset(data, TargetLevel!=0 & Score=='All' & Interval!='PeriFull')
data2$SubjectID = factor(data2$SubjectID)
data2$UnitID = factor(data2$UnitID)
data2$Interval = factor(data2$Interval, c('Onset','Peri','Offset'))
data2$SNR = factor(data2$TargetLevel-50, c(-50,-10,0,10), c('Nogo', -10, 0, 10))
data2$SNRn = data2$TargetLevel-50
data2$TER = data2$TER * 100   # as percentage
data2$TEP = data2$TEP * 100   # as percentage


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

# summary(subset(data2, SubCategory=='Phasic Enhancing', select=c(SubjectID, UnitID)))

model = aov(TER ~ SNR*Mode*SubCategory + Error(factor(UnitID)),
  subset(data2, Category=='Phasic'))
summary(model)

model2 = lm(TER ~ 1 + SNRn*Mode, subset(data2, Category=='Phasic'))
summary(model2)

labs_xy = labs(x='SNR [dB]', y='Target-evoked response [%]')
xintercept = geom_vline(xintercept=2, color='grey85', size=.25, linetype='dashed')
yintercept = geom_hline(yintercept=0, color='grey85', size=.25, linetype='dashed')
ylim = coord_cartesian(ylim=c(-30,30))

# ggplot(data2, aes(x=SNR, y=TER, color=Mode, shape=Category)) +
#   geom_point(size=2, position=position_dodge(width=dg)) +
#   labs_xy + labs(color='Mode') +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=TER, color=Mode, shape=Category)) +
#   se_errorbar + mean_point +
#   labs_xy + labs(color='Mode') +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=TER, shape=Category)) +
#   se_errorbar + mean_point +
#   labs_xy +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=TER, color=Mode)) +
#   se_errorbar + mean_point +
#   labs_xy + labs(color='Mode') +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=TER)) +
#   se_errorbar + mean_point +
#   labs_xy +
#   theme_my

# title = paste('Phasic Units ', length(unique(subset(data2, Category=='Phasic')$UnitID)), ' (dp > ', dp, ')')

p = ggplot(subset(data2, Category=='Phasic'),
           aes(x=SNR, y=TER, color=Mode,
               group=Mode,
               # shape=Category, linetype=Category,
               # group=interaction(Mode, Category)
               )) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  # scale_linetype_manual(values=linetypes) +
  # scale_shape_manual(values=shapes) +
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
  labs_xy + labs(color='Mode', title='Phasic Units') +
  color_manual +
  # ylim +
  expand_x + expand_y +
  theme_my
print(p)
save_plot(p, file=paste('figs/Summary/ter-phasic-', gerbil, '.svg', sep=''))


ylim = coord_cartesian(ylim=c(NaN,150))
p = ggplot(subset(data2, SubCategory %in%
                    c('Phasic Enhancing', 'Phasic Suppressing')),
           aes(x=SNR, y=TER, color=Mode,
               # group=Mode,
               shape=SubCategory, linetype=SubCategory,
               group=interaction(Mode, SubCategory)
           )) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  scale_linetype_manual(values=linetypes) +
  scale_shape_manual(values=shapes) +
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
  labs_xy + labs(color='Mode', title='Phasic Enhancing/Suppressing Units') +
  color_manual +
  ylim +
  expand_x + expand_y +
  theme_my
print(p)
save_plot(p, file=paste('figs/Summary/ter-phasic-', gerbil, '.svg', sep=''))


p = ggplot(subset(data2, Category=='Tonic'),
           aes(x=SNR, y=TER, color=Mode, group=Mode)) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
  labs_xy + labs(color='Mode', title='Tonic units') +
  color_manual +
  ylim + expand_x + expand_y +
  theme_my
p
save_plot(p, file=paste('figs/Summary/ter-tonic-', gerbil, '.svg', sep=''))


#################
# target-evoked peak

labs_xy = labs(x='SNR [dB]', y='Target-evoked peak [%]')

p = ggplot(subset(data2, Category=='Phasic'),
           aes(x=SNR, y=TEP, color=Mode,
               group=Mode,
               # shape=Category, linetype=Category,
               # group=interaction(Mode, Category)
           )) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  # scale_linetype_manual(values=linetypes) +
  # scale_shape_manual(values=shapes) +
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
  labs_xy + labs(color='Mode', title='Phasic Units') +
  color_manual +
  # ylim +
  expand_x + expand_y +
  theme_my
print(p)
save_plot(p, file=paste('figs/Summary/ter-phasic-', gerbil, '.svg', sep=''))


p = ggplot(subset(data2, SubCategory %in%
                    c('Phasic Enhancing', 'Phasic Suppressing')),
           aes(x=SNR, y=TEP, color=Mode,
               # group=Mode,
               shape=SubCategory, linetype=SubCategory,
               group=interaction(Mode, SubCategory)
           )) +
  xintercept + yintercept +
  se_errorbar + mean_line + mean_point +
  scale_linetype_manual(values=linetypes) +
  scale_shape_manual(values=shapes) +
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
  labs_xy + labs(color='Mode', title='Phasic Enhancing/Suppressing Units') +
  color_manual +
  # ylim +
  expand_x + expand_y +
  theme_my
print(p)
save_plot(p, file=paste('figs/Summary/ter-phasic-', gerbil, '.svg', sep=''))


#################
# d prime

model = aov(dPrime ~ SNR*Mode + Error(UnitID), subset(data2, Category=='Phasic'))
summary(model)

model = aov(dPrime ~ SNR*Mode + Error(UnitID), subset(data2, Category=='Tonic'))
summary(model)

model = aov(dPrime ~ SNR*Mode*Category + Error(UnitID), data2)
summary(model)

labs_xy = labs(x='SNR [dB]', y='d\'')
ylim = coord_cartesian(ylim=c(0,1))

p = ggplot(subset(data2, Category=='Phasic'),
           aes(x=SNR, y=dPrime, color=Mode,
               group=Mode,
               # shape=Category, linetype=Category,
               # group=interaction(Mode, Category)
           )) +
  se_errorbar + mean_line + mean_point +
  # scale_linetype_manual(values=linetypes) +
  # scale_shape_manual(values=shapes) +
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
  labs_xy + labs(color='Mode', title='Phasic Units') +
  color_manual +
  ylim +
  expand_x + expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/ter-phasic-', gerbil, '.svg', sep=''))


p = ggplot(subset(data2, SubCategory %in%
                    c('Phasic Enhancing', 'Phasic Suppressing')),
          aes(x=SNR, y=dPrime, color=Mode,
              # group=Mode,
              shape=SubCategory, linetype=SubCategory,
              group=interaction(Mode, SubCategory)
          )) +
  se_errorbar + mean_line + mean_point +
  scale_linetype_manual(values=linetypes) +
  scale_shape_manual(values=shapes) +
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
  labs_xy + labs(color='Mode', title='Phasic Enhancing/Suppressing Units') +
  color_manual +
  ylim +
  expand_x + expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/ter-phasic-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, Category=='Tonic'),
           aes(x=SNR, y=dPrime, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
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
  facet_grid(rows=vars(Effort), cols=vars(Interval)) +
  scale_linetype_manual(values=linetypes) +
  scale_shape_manual(values=shapes) +
  color_manual +
  # scale_alpha_manual(values=c(1, .5)) +
  labs_xy + labs(color='Mode', title='Phasic and tonic units') +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/dp-', gerbil, '.svg', sep=''))


#################
# vector strength

# for (dp in c(.2, .3, .4, .42, .45, .5)) {
# summaryFile = paste('results/Summary-', gerbil, '-Sorted-dp', dp, '.xlsx', sep='')

gc()
# data = read.xlsx(summaryFile, 'Bins')
dataHE = read.xlsx(summaryFileHE, 'Bins')
dataHE$Effort = 'HE'
dataLE = read.xlsx(summaryFileLE, 'Bins')
dataLE$Effort = 'LE'
data = rbind(dataHE, dataLE)

data2 = subset(data, Score=='All' & Category=='Phasic')
data2$Bin = factor(data2$Bin, c('Pre','Peri','Post'))
# as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
# data2$Bin = as.numeric.factor(data2$Bin)
data2$SNR = factor(data2$TargetLevel-50, c(-50,-10,0,10), c('Nogo', -10, 0, 10))

model1 = lme(VS10 ~ SNR*Mode*Bin, data2, random= ~ 1 | UnitID)
summary(model1)
anova(model1)

model2 = aov(VS10 ~ SNR*Mode*Bin + Error(UnitID), subset(data2))
summary(model2)

labs_xy = labs(x='SNR [dB]', y='Vector strength')
ylim = coord_cartesian(ylim=c(0,.6))

# ggplot(data2, aes(x=SNR, y=VS10, color=Mode, shape=Bin)) +
#   geom_point(size=2, position=position_dodge(width=dg)) +
#   labs_xy + labs(color='Mode') +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=VS10, color=Mode, shape=Bin)) +
#   se_errorbar + mean_point +
#   labs_xy + labs(color='Mode') +
#   theme_my
#
# ggplot(data2, aes(x=SNR, y=VS10, shape=Bin)) +
#   se_errorbar + mean_point +
#   labs_xy +
#   theme_my

# p = ggplot(data2, aes(x=SNR, y=VS10, color=Mode, group=Mode)) +
#   se_errorbar + mean_line + mean_point +
#   labs_xy + labs(color='Mode', title='Phasic units') +
#   coord_cartesian(ylim=c(0,.6)) +
#   theme_my
# p
# save_plot(p, file=paste('figs/Summary/VSavg2-', gerbil, '.svg', sep=''))

# title = paste('Phasic Units ', length(unique(subset(data2)$UnitID)), ' (dp > ', dp, ')')

p = ggplot(subset(data2),
           aes(x=SNR, y=VS10, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  facet_grid(rows=vars(Effort), cols=vars(Bin)) +
  labs_xy + labs(color='Mode', title='Phasic Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-', gerbil, '.svg', sep=''))

# }



p = ggplot(subset(data2, SubCategory %in%
                    c('Phasic Enhancing', 'Phasic Suppressing')),
           aes(x=SNR, y=VS10, color=Mode,
               # group=Mode,
               shape=SubCategory, linetype=SubCategory,
               group=interaction(Mode, SubCategory)
           )) +
  se_errorbar + mean_line + mean_point +
  scale_linetype_manual(values=linetypes) +
  scale_shape_manual(values=shapes) +
  facet_grid(rows=vars(Effort), cols=vars(Bin)) +
  labs_xy + labs(color='Mode', title='Phasic Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-', gerbil, '.svg', sep=''))


p = ggplot(subset(data2, Bin==2 & SubCategory=='Phasic Enhancing'),
           aes(x=SNR, y=VS10, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Enhancing Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-enhancing-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, Bin==2 & SubCategory=='Phasic Suppressing'),
           aes(x=SNR, y=VS10, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic Suppressing Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-suppressing-', gerbil, '.svg', sep=''))

p = ggplot(subset(data2, Bin==2 & SubCategory=='Phasic No Change'),
           aes(x=SNR, y=VS10, color=Mode, group=Mode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic No Change Units') +
  color_manual +
  ylim + expand_x + no_expand_y +
  theme_my + grid_xy
print(p)
save_plot(p, file=paste('figs/Summary/VSperi-nochange-', gerbil, '.svg', sep=''))


# violin plot
p = ggplot(subset(data2, Bin==2),
           aes(x=SNR, y=VS10, fill=Mode)) +
  geom_violin(position=position_dodge(.5), alpha=.9, width=.8) +
  labs_xy + labs(fill='Mode', title='Phasic units') +
  fill_manual +
  coord_cartesian(ylim=c(0,NaN)) +
  expand_x + no_expand_y +
  theme_my + grid_xy
p
save_plot(p, file=paste('figs/Summary/VSperi3-', gerbil, '.svg', sep=''))

# ggplot(data2, aes(x=SNR, y=VS10)) +
#   se_errorbar + mean_point +
#   labs_xy +
#   theme_my

# }


################
# GLM

gc()
# data = read.xlsx(summaryFile, 'Intervals')
data1HE = read.xlsx(summaryFileHE, 'Intervals')
data1HE$Effort = 'HE'
data1LE = read.xlsx(summaryFileLE, 'Intervals')
data1LE$Effort = 'LE'
data1LE$UnitID = data1LE$UnitID + max(data1HE$UnitID)
data1 = rbind(data1HE, data1LE)
data1 = subset(data1, Score=='All', select=-c(Score))
data1 = pivot_wider(data1, names_from=Interval, values_from=c(TER, TEP, dPrime))

data2HE = read.xlsx(summaryFileHE, 'Bins')
data2HE$Effort = 'HE'
data2LE = read.xlsx(summaryFileLE, 'Bins')
data2LE$Effort = 'LE'
data2LE$UnitID = data2LE$UnitID + max(data2HE$UnitID)
data2 = rbind(data2HE, data2LE)
data2 = subset(data2, Score=='All' & Bin=='Peri', select=-c(Score, Bin))

data3HE = read.xlsx(summaryFileHE, 'Overall')
data3HE$Effort = 'HE'
data3LE = read.xlsx(summaryFileLE, 'Overall')
data3LE$Effort = 'LE'
data3LE$UnitID = data3LE$UnitID + max(data3HE$UnitID)
data3 = rbind(data3HE, data3LE)
data3 = subset(data3, Score=='All', select=-c(Score))

data = left_join(data1, data2)
data = left_join(data, data3)
data$TrialType = as.integer(data$TargetLevel!=0)
data = na.omit(data)
# data$PSTHCorr[data$TrialType==0] = data$PSTHCorr[data$TrialType==0] -
#   runif(length(data$PSTHCorr[data$TrialType==0]), 0, .1)
# data$PSTHCorr = scale(data$PSTHCorr)

dataSub = subset(data, TargetLevel %in% c(0, 60))

model = glm(TrialType ~ SubCategory:Mode:Effort:(
              # TER_Onset +
              # TER_Peri +
              # TER_Offset +
              # TEP_Onset +
              # TEP_Peri +
              # TEP_Offset +
              FiringMaxOnset +
              FiringMeanPeri +
              FiringMaxOffset +
              VS10*VS10Phase +
              MTS10 +
              # PSTHCorr +
              1
              ),
            binomial, dataSub)
summary(model)

# ggplot(dataSub, aes(x=TargetLevel, y=PSTHCorr)) +
#   se_errorbar + mean_line + mean_point


# Calculate r^2, how much of the variance of the raw data is predicted by fits
dataSub$Fit <- fitted(model)
mean(dataSub$TrialType == (dataSub$Fit>.5))
r2 = cor(dataSub$TrialType, dataSub$Fit)^2
r2

