#verileri içeri aktarma:
library(readr)
library(dplyr)
lab_data <- read_table2("~/GitHub/StatMeth2/Statistical-Methods-2/Multifactor_Setup/JAHANMI2.DAT.txt", 
                        col_types = cols(Lab = col_factor(levels = c("1","2", "3", "4", "5", "6", "7", "8"))))

# Çok etkenli deney düzeni: 
#daha anlaşılabilir hale getirme:
lab_edited <- lab_data %>%
  summarize(Lab=Lab, X3=X3, Y=Y)

res_1<- lm(Y ~ Lab*as.factor(X3), data=lab_edited)
anova(res_1)

#%95 Güven düzeyinde etkileşimler önemlidir. 
#%95 Güven düzeyinde lab etkeni önemsizdir.
#%95 Güven düzeyinde X3 etkeni önemsizdir.