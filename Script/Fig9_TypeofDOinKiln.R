library(ggplot2)
library(here)
library(showtext)
library(sysfonts)

#font_add_google('Nanum Gothic', family='NanumGothic')
#showtext_auto()
#par(family="NanumGothic")

df <- read.csv(here("./Data/DO_in_Kiln.csv"))
df <- na.omit(df)
df_A <- subset(df, 권역 == "A")
df_B <- subset(df, 권역 == "B")

#합본 Dodge
ggplot() +
  geom_bar(data=df,
           aes(x=유물),
           position = position_dodge(preserve = "single")) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 225), breaks=seq(0, 225, 50)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(limits=c("대옹(원통형)", "대옹(기타)", "대옹편")) +
  scale_fill_grey(start=0.1, end=0.5)

#Dodge
ggplot() +
  geom_bar(data=df,
           aes(x=유물, fill=권역),
           position = position_dodge(preserve = "single")) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 125), breaks=seq(0, 125, 50)) +
  theme(legend.position = c(0.2, 0.75),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        plot.title = element_text(hjust = 0.5),
        legend.text = element_text(size=15, color="black")) +
  scale_x_discrete(limits=c("대옹(원통형)", "대옹(기타)", "대옹편")) +
  scale_fill_grey(start=0.1, end=0.5)

ggsave(here("./Graph/Fig_9.png"), dpi=150, width=5, height=5, units='in')

#A권역 Stack
ggplot() +
  geom_bar(data=df_A,
           aes(x=유물, fill=권역)) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 125), breaks=seq(0, 125, 50)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_grey(start=0.1, end=0.5)

#B권역 Stack
ggplot() +
  geom_bar(data=df_B,
           aes(x=유물, fill=권역)) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 125), breaks=seq(0, 125, 50)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_grey(start=0.1, end=0.5)

