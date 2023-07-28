library(ggplot2)

df <- read.csv("C:/github/P3K-HB_Pottery-Kiln/Data/DOKilnnum.csv")
df <- na.omit(df)
xx <- c(0, 1, 2, 3, 4, 5, 6)
yy <- c(16, 3, 5, 0, 1, 0, 3)

ggplot() +
  geom_bar(data=df, aes(x=대옹출토가마)) +
  theme_bw() +
  labs(x="대옹출토 가마 수", y="유적 수") +
  scale_y_continuous(limits = c(0, 15), breaks=seq(0, 15, 1), labels=scales::number) +
  scale_x_continuous(breaks=c(0, 1, 2, 3, 4, 5, 6), labels=c("0", "1", "2", "3", "4", "5", "6"))
ggsave("C:/github/P3K-HB_Pottery-Kiln/Graph/DOKilnnum.png", dpi=150, width=3.5, height=3.5, units='in')