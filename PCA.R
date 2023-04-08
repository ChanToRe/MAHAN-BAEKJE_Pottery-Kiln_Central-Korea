library(httr)
library(devtools)
library(ggplot2)
library(ggbiplot)
library(car)

#Data processing
df <- read.csv("/Users/jch/Desktop/DO_TEST.csv")
df <- df[1:13]
df <- na.omit(df)
df <- df[!(df$Type == "기타" ), ]
df <- df[!(df$Type == "제외" ), ]

df_category <- df[, 5]
df_name <- df[, 4]

df <- df[, -(1:5)]

#Check Multicollinearity
cor(df)
pairs(df, panel=panel.smooth)

#PCA
prcomp_df <- prcomp(df, center=T, scale=T)

summary(prcomp_df)

pca_DO <- ggbiplot(prcomp_df, choices = c(1, 2), obs.scale = 1, labels=df_name,
                   var.scale = 1, groups = df_category) +
                   scale_color_discrete(name = '') +
                   theme(legend.direction = 'horizontal', legend.position = 'top')

print(pca_DO)
