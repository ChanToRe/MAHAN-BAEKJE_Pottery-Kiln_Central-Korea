library(ggplot2)
library(here)
library(showtext)
library(sysfonts)

#font_add_google('Nanum Gothic', family='NanumGothic')
#showtext_auto()
#par(family="NanumGothic")

df <- read.csv(here("./Data/Num_Of_DOKiln.csv"))
df <- na.omit(df)
xx <- c(0, 1, 2, 3, 4, 5, 6)
yy <- c(16, 3, 5, 0, 1, 0, 3)

ggplot() +
  geom_bar(data=df, aes(x=대옹출토가마)) +
  theme_bw() +
  labs(x="대옹출토 가마 수", y="유적 수") +
  scale_y_continuous(limits = c(0, 15), breaks=seq(0, 15, 1), labels=scales::number) +
  scale_x_continuous(breaks=c(0, 1, 2, 3, 4, 5, 6), labels=c("0", "1", "2", "3", "4", "5", "6")) +
  theme(axis.text = element_text(size=15, colour="black"),
      axis.title.x = element_text(size=12, colour="black", face='bold'),
      axis.title.y = element_text(size=12, colour="black", face='bold'))
ggsave(here("./Graph/Fig_9.tiff"), dpi=300, width=5, height=5, units='in')
