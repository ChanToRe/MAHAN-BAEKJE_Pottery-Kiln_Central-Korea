library(ggplot2)
library(showtext)
library(gridExtra)
library(showtext)
library(ggrepel)
library(sysfonts)
library(tidyverse)
#font_add_google('Nanum Gothic', family='NanumGothic')
#showtext_auto()
#par(family="NanumGothic")

df <- read.csv("C:/github/P3K-HB_Pottery-Kiln/Data/DO_in_Settle.csv", fileEncoding="euc-kr")

df <- df[!(df$유역 == ""), ]
df <- df[!(df$유구성격 == ""), ]
A_df <- subset(df, subset = 유역 == "한강하류")
B_df <- subset(df, subset = 유역 == "한강중류")
C_df <- subset(df, subset = 유역 == "임진·한탄강" | 유역 == "경기북부")
D_df <- subset(df, subset = 유역 == "경기남부")
E_df <- subset(df, subset = 유역 == "북한강·남한강")

Type_palette <- c('구상유구'='#DBA901',
                  '기타'='#74DF00',
                  '분묘'='#01DFD7',
                  '수혈'='#2E64FE',
                  '주거지'='#848484')

A_pie <- data.frame(
  Type = c("구상유구", "기타", "분묘", "수혈", "주거지"),
  value = c(length(which(A_df$유구성격 == "구상유구")),
            length(which(A_df$유구성격 == "기타")),
            length(which(A_df$유구성격 == "분묘")),
            length(which(A_df$유구성격 == "수혈")),
            length(which(A_df$유구성격 == "주거지"))),
  percent = c(round(prop.table((table(A_df$유구성격)))*100))
)

B_pie <- data.frame(
  Type = c("구상유구", "기타", "분묘", "수혈", "주거지"),
  value = c(length(which(B_df$유구성격 == "구상유구")),
            length(which(B_df$유구성격 == "기타")),
            length(which(B_df$유구성격 == "분묘")),
            length(which(B_df$유구성격 == "수혈")),
            length(which(B_df$유구성격 == "주거지"))),
  percent = c(11, 8, 0, 57, 23)
  #percent = c(round(prop.table((table(B_df$유구성격)))*100))
)

C_pie <- data.frame(
  Type = c("구상유구", "기타", "분묘", "수혈", "주거지"),
  value = c(length(which(C_df$유구성격 == "구상유구")),
            length(which(C_df$유구성격 == "기타")),
            length(which(C_df$유구성격 == "분묘")),
            length(which(C_df$유구성격 == "수혈")),
            length(which(C_df$유구성격 == "주거지"))),
  percent = c(8, 3, 0, 26, 64)
  #percent = c(round(prop.table((table(C_df$유구성격)))*100))
)

D_pie <- data.frame(
  Type = c("구상유구", "기타", "분묘", "수혈", "주거지"),
  value = c(length(which(D_df$유구성격 == "구상유구")),
            length(which(D_df$유구성격 == "기타")),
            length(which(D_df$유구성격 == "분묘")),
            length(which(D_df$유구성격 == "수혈")),
            length(which(D_df$유구성격 == "주거지"))),
  percent = c(round(prop.table((table(D_df$유구성격)))*100))
)

E_pie <- data.frame(
  Type = c("구상유구", "기타", "분묘", "수혈", "주거지"),
  value = c(length(which(E_df$유구성격 == "구상유구")),
            length(which(E_df$유구성격 == "기타")),
            length(which(E_df$유구성격 == "분묘")),
            length(which(E_df$유구성격 == "수혈")),
            length(which(E_df$유구성격 == "주거지"))),
  percent = c(0, 2, 2, 26, 70)
  #percent = c(round(prop.table((table(E_df$유구성격)))*100))
)

#한강하류 막대그래프
ggplot(A_pie, aes(x=Type, y=percent, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(-2, 70), breaks = seq(-2, 70, 10), labels = paste0(seq(0, 70, 10)))+
  geom_text(aes(label = paste0(round(percent), "%", "(", value, "개", ")")),
            position = position_stack(vjust=0.5),
            colour = 'black',
            size = 4,
            angle=90) +
  labs(x = NULL, y = NULL, title="한강하류") +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -10, hjust=0.1, size=18),
        legend.position = "none",
        axis.text = element_text(size=18, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/Fig_20-1.png", dpi=150, width=3, height=6, units='in')

#한강중류 막대그래프
ggplot(B_pie, aes(x=Type, y=percent, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(-2, 70), breaks = seq(-2, 70, 10), labels = paste0(seq(0, 70, 10)))+
  geom_text(aes(label = paste0(round(percent), "%", "(", value, "개", ")")),
            position = position_stack(vjust=0.5),
            colour = 'black',
            size = 4,
            angle=90) +
  labs(x = NULL, y = NULL, title="한강중류") +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -10, hjust=0.1, size=18),
        legend.position = "none",
        axis.text = element_text(size=18, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/Fig_20-2.png", dpi=150, width=3, height=6, units='in')

#임진·한탄강+경기북부 막대그래프
ggplot(C_pie, aes(x=Type, y=percent, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(-2, 70), breaks = seq(-2, 70, 10), labels = paste0(seq(0, 70, 10)))+
  geom_text(aes(label = paste0(round(percent), "%", "(", value, "개", ")")),
            position = position_stack(vjust=0.5),
            colour = 'black',
            size = 4,
            angle=90) +
  labs(x = NULL, y = NULL, title="임진·한탄강+경기북부") +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -10, hjust=0.1, size=18),
        legend.position = "none",
        axis.text = element_text(size=18, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/Fig_20-3.png", dpi=150, width=3, height=6, units='in')

#경기남부 막대그래프
ggplot(D_pie, aes(x=Type, y=percent, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(-2, 70), breaks = seq(-2, 70, 10), labels = paste0(seq(0, 70, 10)))+
  geom_text(aes(label = paste0(round(percent), "%", "(", value, "개", ")")),
            position = position_stack(vjust=0.5),
            colour = 'black',
            size = 4,
            angle=90) +
  labs(x = NULL, y = NULL, title="경기남부") +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -10, hjust=0.1, size=18),
        legend.position = "none",
        axis.text = element_text(size=18, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/Fig_20-4.png", dpi=150, width=3, height=6, units='in')

#북한강·남한강 막대그래프
ggplot(E_pie, aes(x=Type, y=percent, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(-2, 70), breaks = seq(-2, 70, 10), labels = paste0(seq(0, 70, 10)))+
  geom_text(aes(label = paste0(round(percent), "%", "(", value, "개", ")")),
            position = position_stack(vjust=0.5),
            colour = 'black',
            size = 4,
            angle=90) +
  labs(x = NULL, y = NULL, title="북한강·남한강") +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -10, hjust=0.1, size=18),
        legend.position = "none",
        axis.text = element_text(size=18, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/Fig_20-5.png", dpi=200, width=3, height=6, units='in')
