library(httr)
library(devtools)
library(ggplot2)
library(ggbiplot)

df <- read.csv("/Users/jch/Desktop/백제 대옹 연구/Bakje_DO.csv")

df <- df[!(df$Type == "ETC" ), ]
df <- df[!(df$Type == "Excep" ), ]

df_category <- df[, 2]
df_name <- df[, 1]

df <- df[, -2]
df <- df[, -1]

prcomp_df <- prcomp(df, center=T, scale=T)

summary(prcomp_df)

pca_DO <- ggbiplot(prcomp_df, choices = c(1, 2), obs.scale = 1,
                   var.scale = 1, groups = df_category) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')

print(pca_DO)

