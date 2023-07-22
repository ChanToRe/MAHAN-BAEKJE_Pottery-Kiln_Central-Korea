library(ggplot2)
library(showtext)
library(gridExtra)

df <- read.csv("/Users/jch/Documents/github/P3K-HB_Pottery-Kiln/Data/Size_DO.csv")

#Data Processing
df <- df[!(df$형식 == "?"), ]
A_df <- df[(df$권역 == "A"), ]
B_df <- df[(df$권역 == "B"), ]
A_pie <- data.frame(
  Type = c("⓵", "⓶", "⓷"),
  value = c(length(which(A_df$형식 == "⓵")), length(which(A_df$형식 == "⓶")), length(which(A_df$형식 == "⓷"))),
  percent = c(27, 55, 18)
)
B_pie <- data.frame(
  Type = c("⓵", "⓶", "⓷"),
  value = c(length(which(B_df$형식 == "⓵")), length(which(B_df$형식 == "⓶")), length(which(B_df$형식 == "⓷"))),
  percent = c(88, 6, 6)
)

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