library(ggplot2)

df <- read.csv("C:/github/P3K-HB_Pottery-Kiln/Data/Pottery_in_Kiln.csv")
df <- na.omit(df)
df_A <- subset(df, 권역 == "A")
df_B <- subset(df, 권역 == "B")

#합본
ggplot() +
  geom_bar(data=df,
           aes(x=유물)) +
  theme_bw() +
  scale_y_continuous(limits = c(0, 80), breaks=seq(0, 80, 10)) +
  scale_x_discrete(limits = c("호", "이중구연호", "직구호", "광구단경호", "소호", "장란형토기", "시루", "옹", "발", "경질무문발", "동이", "완", "접시", "소형잔", "반", "분", "세", "자배기", "합", "개", "흑색마연개", "흑색마연완")) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5 ),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_grey(start=0.1, end=0.5)
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/Fig_8.png", dpi=150, width=7, height=4, units='in')

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