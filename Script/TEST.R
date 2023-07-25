library(ggplot2)
library(showtext)
library(gridExtra)
library(showtext)
library(sysfonts)
font_add_google('Nanum Gothic', family='NanumGothic')
showtext_auto()
par(family="NanumGothic")

df <- read.csv("C:/github/P3K-HB_Pottery-Kiln/Data/취락대옹검토.csv")

#####Data Processing#####
df <- df[!(df$유역 == ""), ]
df <- df[!(df$유구성격 == ""), ]
A_df <- subset(df, subset = 유역 == "한강하류")
B_df <- subset(df, subset = 유역 == "한강중류")
C_df <- subset(df, subset = 유역 == "임진·한탄강" | 유역 == "경기북부")
D_df <- subset(df, subset = 유역 == "경기남부")
E_df <- subset(df, subset = 유역 == "북한강·남한강")

Type_palette <- c('건물지'='#DF0101',
                  '구상유구'='#DBA901',
                  '기타'='#74DF00',
                  '분묘'='#01DFD7',
                  '수혈'='#2E64FE',
                  '제사유구'='#A901DB',
                  '주거지'='#848484',
                  '소성유구'='#FF00FF')

all_pie <- data.frame(
  Type = c("건물지", "구상유구", "기타", "분묘", "소성유구", "수혈", "제사유구", "주거지"),
  value = c(length(which(df$유구성격 == "건물지")),
            length(which(df$유구성격 == "구상유구")),
            length(which(df$유구성격 == "기타")),
            length(which(df$유구성격 == "분묘")),
            length(which(df$유구성격 == "소성유구")),
            length(which(df$유구성격 == "수혈")),
            length(which(df$유구성격 == "제사유구")),
            length(which(df$유구성격 == "주거지"))),
  percent = c(round(prop.table((table(df$유구성격)))*100))
)

A_pie <- data.frame(
  Type = c("건물지", "구상유구", "기타", "분묘", "소성유구", "수혈", "제사유구", "주거지"),
  value = c(length(which(A_df$유구성격 == "건물지")),
            length(which(A_df$유구성격 == "구상유구")),
            length(which(A_df$유구성격 == "기타")),
            length(which(A_df$유구성격 == "분묘")),
            length(which(A_df$유구성격 == "소성유구")),
            length(which(A_df$유구성격 == "수혈")),
            length(which(A_df$유구성격 == "제사유구")),
            length(which(A_df$유구성격 == "주거지"))),
  percent = c("-", 15, 6, 22, "-", 18, "-", 40)
)

B_pie <- data.frame(
  Type = c("건물지", "구상유구", "기타", "분묘", "소성유구", "수혈", "제사유구", "주거지"),
  value = c(length(which(B_df$유구성격 == "건물지")),
            length(which(B_df$유구성격 == "구상유구")),
            length(which(B_df$유구성격 == "기타")),
            length(which(B_df$유구성격 == "분묘")),
            length(which(B_df$유구성격 == "소성유구")),
            length(which(B_df$유구성격 == "수혈")),
            length(which(B_df$유구성격 == "제사유구")),
            length(which(B_df$유구성격 == "주거지"))),
  percent = c(1, 11, 8, 0, "-", 56, 1, 22)
)

C_pie <- data.frame(
  Type = c("건물지", "구상유구", "기타", "분묘", "소성유구", "수혈", "제사유구", "주거지"),
  value = c(length(which(C_df$유구성격 == "건물지")),
            length(which(C_df$유구성격 == "구상유구")),
            length(which(C_df$유구성격 == "기타")),
            length(which(C_df$유구성격 == "분묘")),
            length(which(C_df$유구성격 == "소성유구")),
            length(which(C_df$유구성격 == "수혈")),
            length(which(C_df$유구성격 == "제사유구")),
            length(which(C_df$유구성격 == "주거지"))),
  percent = c("-", 8,  3, "-", "-", 26, "-", 64)
)

D_pie <- data.frame(
  Type = c("건물지", "구상유구", "기타", "분묘", "소성유구", "수혈", "제사유구", "주거지"),
  value = c(length(which(D_df$유구성격 == "건물지")),
            length(which(D_df$유구성격 == "구상유구")),
            length(which(D_df$유구성격 == "기타")),
            length(which(D_df$유구성격 == "분묘")),
            length(which(D_df$유구성격 == "소성유구")),
            length(which(D_df$유구성격 == "수혈")),
            length(which(D_df$유구성격 == "제사유구")),
            length(which(D_df$유구성격 == "주거지"))),
  percent = c(1,10, 6, 3, 1, 39, "-", 40)
)

E_pie <- data.frame(
  Type = c("건물지", "구상유구", "기타", "분묘", "소성유구", "수혈", "제사유구", "주거지"),
  value = c(length(which(E_df$유구성격 == "건물지")),
            length(which(E_df$유구성격 == "구상유구")),
            length(which(E_df$유구성격 == "기타")),
            length(which(E_df$유구성격 == "분묘")),
            length(which(E_df$유구성격 == "소성유구")),
            length(which(E_df$유구성격 == "수혈")),
            length(which(E_df$유구성격 == "제사유구")),
            length(which(E_df$유구성격 == "주거지"))),
  percent = c("-", "-", 6, 6, "-", 24, "-", 64)
)

#####Visualization#####
#전체 파이차트
p_all <- ggplot(all_pie, aes(x='', y=value, fill=Type)) +
  geom_bar(stat='identity') +
  coord_polar('y', start=0) +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")),
            position = position_stack(vjust=0.5),
            colour = 'black', size = 5) +
  #geom_label_repel(data = all_pie,
  #                 aes(label = paste0(value, "%")),
  #                 size = 4.5, nudge_x = 1, show.legend = FALSE)
  labs(x = NULL, y = NULL, title = "전체") +
  scale_fill_manual(values=Type_palette) +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -5, hjust=0.5),
        title = element_text(size=20))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/TESTall.png", dpi=150, width=5, height=5, units='in')

#한강하류 막대그래프
p1 <- ggplot(A_pie, aes(x=Type, y=value, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(0, 150), breaks = seq(0, 150, 10), labels = paste0(seq(0, 150, 10)))+
  coord_flip() +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")),
            position = position_stack(vjust=1),
            colour = 'black') +
  labs(x = NULL, y = NULL) +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = 1, hjust=0.5, size=15),
        legend.position = "none",
        axis.text = element_text(size=12, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/TEST1.png", dpi=150, width=6, height=2, units='in')

#한강중류 막대그래프
p2 <- ggplot(B_pie, aes(x=Type, y=value, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(0, 150), breaks = seq(0, 150, 10), labels = paste0(seq(0, 150, 10)))+
  coord_flip() +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")),
            position = position_stack(vjust=1),
            colour = 'black') +
  labs(x = NULL, y = NULL) +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = 1, hjust=0.5, size=15),
        legend.position = "none",
        axis.text = element_text(size=12, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/TEST2.png", dpi=150, width=6, height=2, units='in')

#임진·한탄강+경기북부 막대그래프
p3 <- ggplot(C_pie, aes(x=Type, y=value, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(0, 150), breaks = seq(0, 150, 10), labels = paste0(seq(0, 150, 10)))+
  coord_flip() +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")),
            position = position_stack(vjust=1),
            colour = 'black') +
  labs(x = NULL, y = NULL) +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = 1, hjust=0.5, size=15),
        legend.position = "none",
        axis.text = element_text(size=12, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/TEST3.png", dpi=150, width=6, height=2, units='in')

#경기남부 막대그래프
p4 <- ggplot(D_pie, aes(x=Type, y=value, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(0, 150), breaks = seq(0, 150, 10), labels = paste0(seq(0, 150, 10)))+
  coord_flip() +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")),
            position = position_stack(vjust=1),
            colour = 'black') +
  labs(x = NULL, y = NULL) +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = 1, hjust=0.5, size=15),
        legend.position = "none",
        axis.text = element_text(size=12, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/TEST4.png", dpi=150, width=6, height=2, units='in')

#북한강·남한강 막대그래프
p5 <- ggplot(E_pie, aes(x=Type, y=value, fill=Type)) +
  geom_bar(stat='identity') +
  scale_y_continuous(limits = c(0, 150), breaks = seq(0, 150, 10), labels = paste0(seq(0, 150, 10)))+
  coord_flip() +
  geom_text(aes(label = paste0(round(value), "(", percent, "%", ")")),
            position = position_stack(vjust=1),
            colour = 'black') +
  labs(x = NULL, y = NULL) +
  scale_fill_manual(values=Type_palette) +
  theme_bw() +
  theme(axis.line = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = 1, hjust=0.5, size=15),
        legend.position = "none",
        axis.text = element_text(size=12, colour="black"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/TEST5.png", dpi=150, width=6, height=2, units='in')

grid.arrange(p1, p2, p3, p4, p5, ncol=1)