library(httr)
library(devtools)
library(ggplot2)
library(ggbiplot)
library(car)
library(here)
library(showtext)
library(sysfonts)

#font_add_google('Nanum Gothic', family='NanumGothic')
#showtext_auto()
#par(family="NanumGothic")

#Data processing
df <- read.csv(here("./Data/Original_Size_Of_DO.csv"))
df <- df[1:13]
df <- na.omit(df)
df <- df[!(df$Type == "기타" ), ]
df <- df[!(df$Type == "제외" ), ]

df_category <- df[, 5]
df_name <- df[, 4]

df <- df[, -(1:5)]

#Check Multicollinearity
#cor(df)
#pairs(df, panel=panel.smooth)

#PCA
prcomp_df <- prcomp(df, center=T, scale=T)
summary(prcomp_df)
prcomp_df$rotation[,1:2]

#유구명
#ggbiplot(prcomp_df,
#         choices = c(1, 2),
#         obs.scale = 1,
#         labels=df_name,
#         var.scale = 1,
#         groups = df_category) +
#  theme_bw() +
#  scale_color_discrete(name = '') +
#  theme(legend.title = element_blank(),
#        legend.position = c(0.1, 0.85),
#        legend.background = element_rect(size=0.1,
#                                         colour="black"))

#점
ggbiplot(prcomp_df,
         choices = c(1, 2),
         obs.scale = 1,
         var.scale = 1) +
  theme_bw() +
  scale_color_discrete(name = '') +
  geom_point(aes(shape=df_category), size=3) +
  scale_shape_manual(values=c(15, 16, 17)) +
  theme(legend.title = element_blank(),
        legend.position = c(0.12, 0.85),
        legend.background = element_rect(size=0.1, colour="black"),
        legend.margin = margin(10, 20, 10, 10))

ggsave(here("./Graph/Fig_8.png"), dpi=150, width=6, height=6, units='in')