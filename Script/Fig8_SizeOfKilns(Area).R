library(ggplot2)
library(patchwork)
library(ggalt)
library(here)
library(showtext)
library(sysfonts)

#font_add_google('Nanum Gothic', family='NanumGothic')
#showtext_auto()
#par(family="NanumGothic")

df <- read.csv(here("./Data/Size_Of_Kiln.csv"))
df <- na.omit(df)

ggplot(data = df,
    aes(x=소성실길이,
        y=소성실폭,
        shape=대옹)) +
geom_point(size=2.5) +
theme_bw() +
theme(legend.position = c(0.11, 0.750),
    legend.background = element_rect(size=0.1,
                                     colour="black"),
    legend.margin = margin(10, 20, 10, 10)) +
    scale_shape_manual(values=c(1,19)) +
    scale_x_continuous(limits = c(125, 800), breaks=seq(0, 800, 50)) +
    scale_y_continuous(limits = c(100, 275), breaks=seq(0, 275, 50)) +
    scale_size_continuous(guide=FALSE) +
    labs(x = "소성실 길이", y = "소성실 폭") +
      theme(plot.caption = element_text(size = 12, hjust = 0),
      legend.title=element_text(size=18),
      legend.text=element_text(size=15),
      axis.text = element_text(size=15, colour="black"),
      axis.title.x = element_text(size=12, colour="black", face='bold'),
      axis.title.y = element_text(size=12, colour="black", face='bold')
      )


ggsave(here("./Graph/Fig_8.tiff"), dpi=300, width=8, height=3, units='in')