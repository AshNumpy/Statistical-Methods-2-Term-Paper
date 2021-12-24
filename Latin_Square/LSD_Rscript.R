#---------------
# Verilerin içeri aktarýlmasý
#---------------
library(readxl)
data = read_excel(path = "C:/Users/lenovo/Documents/GitHub/StatMeth2/Statistical-Methods-2/Latin_Square/data_ls.xlsx",
                col_names = TRUE)

head(data)
str(data)

#--------------------
# Veri yapýsýna bakýlýp satýr ve sütunlara ait deðerler girildiðinde:
#---1-2-3-4-
#-1-B-D-C-A-
#-2-C-A-D-B-
#-3-A-C-B-D-
#-4-D-B-A-C-
# Þeklinde Latin Kare yapýmýz ortaya çýkýyor


#--------------------
# Deðiþkenlerin yapýsýný faktöre dönüþtürme
#--------------------
data$Row <- as.factor(data$Row)
data$Column <- as.factor(data$Column)
data$Varieties <- as.factor(data$Varieties)
str(data)

attach(data)

#------------------------------------
# 'Model' deðiþkenine ANOVA uygulama
#------------------------------------
model <- lm(Yield ~ Row+Column+Varieties)
anova(model)#Çeþitlerin verdiði verimler arasý fark var

#--------------------
# Ortalama Karþýlaþtýrma testi
#--------------------
library(agricolae)
# LSD test
LSD.test(y = model,
         trt = "Varieties",
         DFerror = model$df.residual,
         MSerror = deviance(model)/model$df.residual,
         alpha = 0.05,
         group = TRUE,
         console = TRUE)


# SNK test
SNK.test(y = Yield,
         trt = Varieties,
         DFerror = model$df.residual,
         MSerror = deviance(model)/model$df.residual,
         alpha = 0.05,
         group = TRUE,
         console = TRUE)


#--------------------
# LSD ve SNK testine göre söylenebilir ki A çeþidinin verimi diðerlerinden farklýdýr.
#--------------------