library(nlme) # lme
library(xlsx) # read.xlsx
library(tidyr) # gather
library(dplyr) # recode
library(ggplot2) # ggplot


#################
# target evoked response

data = read.xlsx('AnalysisNJIT\Summary-All-Sorted.xlsx', 'DeltaPSTH')
data2 = subset(data, is.na(Score))
data2$Type = factor(data2$Phasic, levels=c(T,F), labels=c('Phasic', 'Tonic'))
data2$SNR = factor(data2$TargetLevel-50)

model = aov(DeltaPSTH ~ TargetLevel*RecMode + Error(factor(UnitID)), subset(data2, Type=='Phasic'))
summary(model)

dg = .3
labs_xy = labs(x='SNR (dB)', y='Target-evoked response')
theme_my = theme_bw() + theme(plot.title=element_text(hjust=0.5))  # Center title
mean_point = stat_summary(fun.y=mean, geom='point', size=3,
                          position=position_dodge(width=dg))
mean_line = stat_summary(fun.y='mean', geom='line', size=1,
                         position=position_dodge(width=dg))
se_errorbar = stat_summary(fun.data=mean_se, geom='errorbar',
                           width=dg*.8, size=1, position=position_dodge(width=dg))

ggplot(data2, aes(x=SNR, y=DeltaPSTH, color=RecMode, shape=Type)) +
  geom_point(size=2, position=position_dodge(width=dg)) +
  labs_xy + labs(color='Mode') +
  theme_my

ggplot(data2, aes(x=SNR, y=DeltaPSTH, color=RecMode, shape=Type)) +
  se_errorbar + mean_point +
  labs_xy + labs(color='Mode') +
  theme_my

ggplot(data2, aes(x=SNR, y=DeltaPSTH, shape=Type)) +
  se_errorbar + mean_point +
  labs_xy +
  theme_my

ggplot(data2, aes(x=SNR, y=DeltaPSTH, color=RecMode)) +
  se_errorbar + mean_point +
  labs_xy + labs(color='Mode') +
  theme_my

ggplot(data2, aes(x=SNR, y=DeltaPSTH)) +
  se_errorbar + mean_point +
  labs_xy +
  theme_my


ggplot(subset(data2, Type=='Phasic'), aes(x=SNR, y=DeltaPSTH, color=RecMode, group=RecMode)) +
  se_errorbar + mean_line + mean_point + 
  labs_xy + labs(color='Mode', title='Phasic units') +
  theme_my

ggplot(subset(data2, Type=='Tonic'), aes(x=SNR, y=DeltaPSTH, color=RecMode, group=RecMode)) +
  se_errorbar + mean_line + mean_point + 
  labs_xy + labs(color='Mode', title='Tonic units') +
  theme_my


#################
# vector strength

data = read.xlsx('Summary-All-Sorted.xlsx', 'VectorStrength')
data2 = subset(data, is.na(Score) & Phasic)
# data2$Type = factor(data2$Phasic, levels=c(T,F), labels=c('Phasic', 'Tonic'))
data2$Bin = factor(data2$Bin, c('Pre','Peri','Post'), 1:3)
# as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
# data2$Bin = as.numeric.factor(data2$Bin)
data2$SNR = factor(data2$TargetLevel-50, c(-50,-10,0,10), c('Nogo', -10, 0, 10))

model1 = lme(VectorStrength ~ SNR*RecMode*Bin, data2, random= ~ 1 | UnitID)
summary(model1)
anova(model1)

model2 = aov(VectorStrength ~ TargetLevel*RecMode*Bin + Error(UnitID), subset(data2))
summary(model2)

labs_xy = labs(x='SNR (dB)', y='Vector strength')

ggplot(data2, aes(x=SNR, y=VectorStrength, color=RecMode, shape=Bin)) +
  geom_point(size=2, position=position_dodge(width=dg)) +
  labs_xy + labs(color='Mode') +
  theme_my

ggplot(data2, aes(x=SNR, y=VectorStrength, color=RecMode, shape=Bin)) +
  se_errorbar + mean_point +
  labs_xy + labs(color='Mode') +
  theme_my

ggplot(data2, aes(x=SNR, y=VectorStrength, shape=Bin)) +
  se_errorbar + mean_point +
  labs_xy +
  theme_my

ggplot(data2, aes(x=SNR, y=VectorStrength, color=RecMode, group=RecMode)) +
  se_errorbar + mean_point +
  labs_xy + labs(color='Mode', title='Phasic units') +
  theme_my

ggplot(data2, aes(x=SNR, y=VectorStrength)) +
  se_errorbar + mean_point +
  labs_xy +
  theme_my


#################
# d prime

data = read.xlsx('Summary-All-Sorted.xlsx', 'dPrime')
data2 = subset(data, is.na(Score) & 0<=Time & Time<=1, select=-c(Score))
data2$Type = factor(data2$Phasic, levels=c(T,F), labels=c('Phasic', 'Tonic'))
data2$SNR = factor(data2$TargetLevel-50)

model = aov(dPrime ~ TargetLevel*RecMode*Type + Error(UnitID), subset(data3))
summary(model)

data3 = data2 %>%
  group_by_at(vars(-c(Time, dPrime))) %>%
  summarize(dPrime=sqrt(mean(dPrime^2)))

labs_xy = labs(x='SNR (dB)', y='d\'')

ggplot(subset(data3, Type=='Phasic'), aes(x=SNR, y=dPrime, color=RecMode, group=RecMode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Phasic units') +
  theme_my

ggplot(subset(data3, Type=='Tonic'), aes(x=SNR, y=dPrime, color=RecMode, group=RecMode)) +
  se_errorbar + mean_line + mean_point +
  labs_xy + labs(color='Mode', title='Tonic units') +
  theme_my
