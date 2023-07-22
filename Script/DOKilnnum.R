library(ggplot2)

df <- read.csv("/Users/jch/Desktop/DOKilnnum.csv")
df <- na.omit(df)
xx <- c(0, 1, 2, 3, 4, 5, 6)
yy <- c(16, 3, 5, 0, 1, 0, 3)



ggplot() +
  geom_bar(data=df, aes(x=대옹출토가마)) +
  geom_line(aes(x=xx, y=yy), linetype = "dashed", size = 0.5) +
  theme_bw() +
  labs(x="대옹출토 가마 수", y="유적 수") +
  scale_y_continuous(limits = c(0, 16), breaks=seq(0, 16, 1), labels=scales::number) +
  scale_x_continuous(breaks=c(0, 1, 2, 3, 4, 5, 6), labels=c("0", "1", "2", "3", "4", "5", "6")) +
ggsave("/Users/jch/Desktop/DOKilnnum.png", dpi=150, width=3.5, height=3.5, units='in')