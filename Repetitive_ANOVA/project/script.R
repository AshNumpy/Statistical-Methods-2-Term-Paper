#---------------
# Verileri içeri aktarma
#---------------
library(haven)
library(tidyverse)
library(ggpubr)
library(rstatix)
rept_data <- read_sav("~/GitHub/StatMeth2/Statistical-Methods-2/Repetitive_ANOVA/repeated_measures.sav")
View(rept_data)

#---------------
# Verileri manipüle etme
#---------------
rept_data[,5] <- list(seq(1,30,1))
colnames(rept_data) <- c("TIME1","TIME2","TIME3","TIME4","id")

rp_factor <- rept_data %>%
  gather(key = "time", value = "score", TIME1, TIME2, TIME3, TIME4) %>%
  convert_as_factor(id,time)
  
head(rp_factor, 3)

# Ortalama ve st. sapma değerleri:
rp_factor%>%
  group_by(time) %>%
  get_summary_stats(score, type = "mean_sd")

# Aykırı değer kontrolü
rp_factor %>%
  group_by(time) %>%
  identify_outliers(score) # "EXTREME" bir aykırı değer yok 

# Normallik testi
rept_data_factor %>%
  group_by(time) %>%
  shapiro_test(score) # p>0.05 için hepsi normal dağılıyor

# ANOVA testi
res.aov <- anova_test(data = rp_factor, dv = score, wid = id, within = time)
get_anova_table(res.aov) 
#[(F~h~(2,61)=7,664) > (F~t~(2,60)=3,15)]  aynı zamanda P~value~=0.00091 < alpha=0.10 için;
# H0 (Zamanlar arası fark yoktur) red edilir. Yani zamanlar arasında farklılık vardır.

