#One-Way ANOVA
#---------------------
# Verilerin çekilmesi
#---------------------
library(readxl)
crop_data <- read_excel("C:/Users/lenovo/Documents/GitHub/StatMeth2/Statistical-Methods-2/One_way_ANOVA/one_way_data.xlsx")

shapiro.test(crop_data$yield)
bartlett.test(yield~fertilizer,data=crop_data)

#---------------------
# ANOVA hesabı
#---------------------
rez_aov <- aov(yield ~ fertilizer, data = crop_data)
summary(rez_aov)# %95 güvenle söylenebilir ki gübreler arasında farklılık vardır.

#---------------------
# Post-Hoc testi
#---------------------
TukeyHSD(rez_aov)
#2 ile 1 ..... fark anlamlı değil
#3 ile 1 ..... fark anlamlı
#3 ile 2 ..... fark anlamlı değil

#---------------------
# Özetleyici istatistikler
#---------------------
library(dplyr)
sum_1<-summary(crop_data[crop_data$fertilizer==1,])
sum_2<-summary(crop_data[crop_data$fertilizer==2,])
sum_3<-summary(crop_data[crop_data$fertilizer==3,])
#Post Hoc testlerinden yararlanılarak %95 güvenle söylenebilir ki 3 numaralı gübre en iyisidir.
