library(ggplot2)
library(showtext)
library(gridExtra)
library(showtext)
library(sysfonts)
library(gridExtra)
font_add_google('Nanum Gothic', family='NanumGothic')
showtext_auto()
par(family="NanumGothic")

df <- read.csv("/Users/jch/Desktop/취락대옹검토.csv")

#Data Processing
df <- df[!(df$위치 == ""), ]
df <- df[!(df$유구성격 == ""), ]

A_df <- df[(df$위치 == "한강하류+인천김포+파주"), ]
B_df <- df[(df$위치 == "풍납토성일대"), ]
C_df <- df[(df$위치 == "북한강+임진한탄강+경기북부"), ]
D_df <- df[(df$위치 == "경기남부"), ]


A_pie <- data.frame(
  Type = c("가마", "구상유구", "주거지", "분묘", "기타", "수혈"),
  value = c(length(which(A_df$유구성격 == "가마")), length(which(A_df$유구성격 == "구상유구")), length(which(A_df$유구성격 == "주거지")),length(which(A_df$유구성격 == "분묘")),length(which(A_df$유구성격 == "기타")),length(which(A_df$유구성격 == "수혈"))),
  percent = c(5, 14, 37, 20, 5, 18)
)
B_pie <- data.frame(
  Type = c("구상유구", "주거지", "건물지", "기타", "수혈"),
  value = c(length(which(B_df$유구성격 == "구상유구")), length(which(B_df$유구성격 == "주거지")),length(which(B_df$유구성격 == "건물지")),length(which(B_df$유구성격 == "기타")),length(which(B_df$유구성격 == "수혈"))),
  percent = c(10, 35, 3, 15, 37)
)
C_pie <- data.frame(
  Type = c("구상유구", "주거지", "분묘", "기타", "수혈"),
  value = c(length(which(C_df$유구성격 == "구상유구")), length(which(C_df$유구성격 == "주거지")),length(which(C_df$유구성격 == "분묘")),length(which(C_df$유구성격 == "기타")),length(which(C_df$유구성격 == "수혈"))),
  percent = c(5, 68, 3, 4, 20)
)
D_pie <- data.frame(
  Type = c("가마", "구상유구", "주거지", "건물지", "분묘", "기타", "수혈"),
  value = c(length(which(D_df$유구성격 == "가마")), length(which(D_df$유구성격 == "구상유구")), length(which(D_df$유구성격 == "주거지")),length(which(D_df$유구성격 == "건물지")),length(which(D_df$유구성격 == "분묘")),length(which(D_df$유구성격 == "기타")),length(which(D_df$유구성격 == "수혈"))),
  percent = c(2, 6, 41, 2, 5, 14, 30)
)

#A권역 원 그래프
p1 <- ggplot(A_pie, aes(x='', y=value, fill=Type)) +
  geom_bar(stat='identity') +
  coord_polar('y', start=0) +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")), position = position_stack(vjust=0.5), colour = 'white') +
  labs(x = NULL, y = NULL, title = "한강하류 + 인천김포 + 파주") +
  theme_classic() + theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -5, hjust=0.5))
ggsave("/Users/jch/Desktop/TEST1.png", dpi=150, width=5, height=5, units='in')

#B권역 원 그래프
p2 <- ggplot(B_pie, aes(x='', y=value, fill=Type)) +
  geom_bar(stat='identity') +
  coord_polar('y', start=0) +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")), position = position_stack(vjust=0.5), colour = 'white') +
  labs(x = NULL, y = NULL, title = "풍납토성일대") +
  theme_classic() + theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -5, hjust=0.5))
ggsave("/Users/jch/Desktop/TEST2.png", dpi=150, width=5, height=5, units='in')

#C권역 원 그래프
p3 <- ggplot(C_pie, aes(x='', y=value, fill=Type)) +
  geom_bar(stat='identity') +
  coord_polar('y', start=0) +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")), position = position_stack(vjust=0.5), colour = 'white') +
  labs(x = NULL, y = NULL, title = "북한강 + 임진한탄강 + 경기북부") +
  theme_classic() + theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -5, hjust=0.5))
ggsave("/Users/jch/Desktop/TEST3.png", dpi=150, width=5, height=5, units='in')

#D권역 원 그래프
p4 <- ggplot(D_pie, aes(x='', y=value, fill=Type)) +
  geom_bar(stat='identity') +
  coord_polar('y', start=0) +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")), position = position_stack(vjust=0.5), colour = 'white') +
  labs(x = NULL, y = NULL, title = "경기남부") +
  theme_classic() + theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -5, hjust=0.5))
ggsave("/Users/jch/Desktop/TEST4.png", dpi=150, width=5, height=5, units='in')
