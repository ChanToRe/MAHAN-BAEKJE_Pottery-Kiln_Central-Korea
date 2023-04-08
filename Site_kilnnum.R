library(ggplot2)

df <- read.csv("~/Desktop/Site_kilnnum.csv")
df <- na.omit(df)

ggplot() +
  geom_histogram(data = df,
                 aes(x=가마수량, fill=대옹출토여부),
                 binwidth = 1,
                 color="black") +
  theme_bw() +
  theme(legend.position = c(0.8, 0.8),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10)) +
  scale_x_continuous(breaks = c(1:9)) +
  scale_y_continuous(breaks = c(0:10)) +
  labs(x="유적수", y="가마수량")