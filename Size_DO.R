library(ggplot2)

df <- read.csv("~/Desktop/Size_DO.csv")
df <- na.omit(df)

ggplot() +
  geom_point(data = df, aes(x=소성실길이,
                            y=소성실폭,
                            colour=대옹출토여부)) +
  theme_bw() +
  theme(legend.position = c(0.85, 0.1),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10)) +
  scale_color_manual(values=c("red", "blue"),
                     labels=c("O", "X")) +
  labs(x = "소성실 길이", y = "소성실 폭")