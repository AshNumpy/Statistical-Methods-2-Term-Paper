#--------------
# Veirleri içeri aktarma
#--------------
library(readxl)
cb_data<- read_excel("~/GitHub/StatMeth2/Statistical-Methods-2/Randomized_Block_ANOVA/castle_bakery_data.xlsx")
colnames(cb_data) <- c("Heights","Display_regular","Display_wide")
#----------------
# Normallik testi
#----------------
shapiro.test(cb_data$Display_regular)
shapiro.test(cb_data$Display_wide)

#--------------------
# Varyans homojenliği
#--------------------

bartlett.test(Display_regular ~ Heights, data=cb_data)




Soru1$firin<-as.factor(Soru1$firin)
anova_1<-aov(agirlik~firin,data=Soru1)
summary(anova_1)


