library(ggplot2)
library(showtext)
library(patchwork)
library(ggalt)

#font_add_google("NanumGothic", family=NG)
showtext_auto()

df <- read.csv("/Users/jch/Documents/github/P3K-HB_Pottery-Kiln/Data/Size_DO.csv")
df <- na.omit(df)

p1 <- ggplot(data = df,
       aes(x=소성실길이,
           y=소성실폭,
           shape=대옹)) +
  geom_point(size=2.5) +
  theme_bw() +
  theme(legend.position = c(0.08, 0.750),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10)) +
  scale_shape_manual(values=c(1,19)) +
  scale_x_continuous(limits = c(125, 800), breaks=seq(0, 800, 50)) +
  scale_y_continuous(limits = c(100, 275), breaks=seq(0, 275, 50)) +
  scale_size_continuous(guide=FALSE) +
  labs(x = "소성실 길이", y = "소성실 폭") +
  theme(plot.caption = element_text(size = 12, hjust = 0))

p2 <- ggplot(data = df,
      aes(x=소성실길이,
          y=소성실폭,
          shape=권역)) +
  geom_point(size=2.5) +
  theme_bw() +
  theme(legend.position = c(0.08, 0.750),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10)) +
  scale_shape_manual(values=c(15,0)) +
  scale_x_continuous(limits = c(125, 800), breaks=seq(0, 800, 50)) +
  scale_y_continuous(limits = c(100, 275), breaks=seq(0, 275, 50)) +
  scale_size_continuous(guide=FALSE) +
  labs(x = "소성실 길이", y = "소성실 폭") +
  theme(plot.caption = element_text(size = 12, hjust = 0))

p2
p1