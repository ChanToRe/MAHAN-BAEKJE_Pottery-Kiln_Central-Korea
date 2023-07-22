library(ggplot2)

df <- read.csv("/Users/jch/Documents/github/P3K-HB_Pottery-Kiln/Data/Site_kilnnum.csv", fileEncoding = "euc-kr")
df <- na.omit(df)
df_A <- subset(df, 권역 == "A")
df_B <- subset(df, 권역 == "B")

#A권역 Dodge
ggplot() +
  geom_bar(data=df_A,
           aes(x=유적명, fill=대옹출토여부),
           position = position_dodge(preserve = "single"),
           width=0.5) +
  coord_flip() +
  theme_bw() +
  scale_y_continuous(limits = c(0, 10), breaks=seq(0, 10, 1)) +
  theme(legend.position = c(0.8, 0.8),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_grey(start=0.3, end=0.8) +
  labs(title = '가마 군집-대옹 생산 상관성(A권역)',
       x="", y="가마수량")

#A권역 Stack
ggplot() +
  geom_bar(data=df_A,
           aes(x=유적명, fill=대옹출토여부)) +
  coord_flip() +
  theme_bw() +
  scale_y_continuous(limits = c(0, 10), breaks=seq(0, 10, 1)) +
  theme(legend.position = c(0.8, 0.8),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_grey(start=0.3, end=0.8) +
  labs(title = '가마 군집-대옹 생산 상관성(A권역)',
       x="", y="가마수량")

#B권역 Dodge
ggplot() +
  geom_bar(data=df_B,
           aes(x=유적명, fill=대옹출토여부),
           position = position_dodge(preserve = "single"),
           width=0.5) +
  coord_flip() +
  theme_bw() +
  scale_y_continuous(limits = c(0, 10), breaks=seq(0, 10, 1)) +
  theme(legend.position = c(0.8, 0.8),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_grey(start=0.3, end=0.8) +
  labs(title = '가마 군집-대옹 생산 상관성(B권역)',
       x="", y="가마수량")

#B권역 Stack
ggplot() +
  geom_bar(data=df_B,
           aes(x=유적명, fill=대옹출토여부)) +
  coord_flip() +
  theme_bw() +
  scale_y_continuous(limits = c(0, 10), breaks=seq(0, 10, 1)) +
  theme(legend.position = c(0.8, 0.8),
        legend.background = element_rect(size=0.1,
                                         colour="black"),
        legend.margin = margin(10, 20, 10, 10),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_grey(start=0.3, end=0.8) +
  labs(title = '가마 군집-대옹 생산 상관성(B권역)',
       x="", y="가마수량")