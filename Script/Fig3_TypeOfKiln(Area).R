library(ggplot2)
library(here)
library(showtext)
library(sysfonts)

#font_add_google('Nanum Gothic', family='NanumGothic')
#showtext_auto()
#par(family="NanumGothic")

df <- read.csv(here("./Data/Size_Of_Kiln.csv"))

#Data Processing
df <- df[!(df$형식 == "?"), ]
A_df <- df[(df$권역 == "A"), ]
B_df <- df[(df$권역 == "B"), ]

A_pie <- data.frame(
  Type = c("⓵", "⓶", "⓷"),
  value = c(length(which(A_df$형식 == "⓵")), length(which(A_df$형식 == "⓶")), length(which(A_df$형식 == "⓷"))),
  percent = c(round(prop.table((table(A_df$형식)))*100))
)
B_pie <- data.frame(
  Type = c("⓵", "⓷"),
  value = c(length(which(B_df$형식 == "⓵")), length(which(B_df$형식 == "⓷"))),
  percent = c(88, 12)
  #percent = c(round(prop.table((table(B_df$형식)))*100))
)
a <- c(round(prop.table((table(B_df$형식)))*100))
#A권역 원 그래프
ggplot(A_pie, aes(x='', y=value, fill=Type)) +
  geom_bar(stat='identity') +
  theme_bw() +
  coord_polar('y', start=0) +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")), position = position_stack(vjust=0.5), colour = 'white') +
  scale_fill_grey() +
  labs(x = NULL, y = NULL, title = "A권역") +
  theme_classic() + theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -5, hjust=0.5))
ggsave(here("./Graph/Fig_3-1.tiff"), dpi=300, width=4, height=4, units='in')

#B권역 원 그래프
ggplot(B_pie, aes(x='', y=value, fill=Type)) +
  geom_bar(stat='identity') +
  scale_colour_grey() +
  theme_bw() +
  coord_polar('y', start=0) +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")), position = position_stack(vjust=0.5), colour = 'white') +
  scale_fill_grey() +
  labs(x = NULL, y = NULL, title = "B권역") +
  theme_classic() + theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -5, hjust=0.5))
ggsave(here("./Graph/Fig_3-2.tiff"), dpi=300, width=4, height=4, units='in')
