library(ggplot2)

df <- read.csv("~/Desktop/Size_DO.csv")
df <- na.omit(df)

#0.5 단위
ggplot() +
  geom_histogram(data = df,
                 aes(x=소성실장단비),
                 binwidth = 0.5,
                 color="black") +
  theme_bw() +
  scale_y_continuous(breaks = c(0:15)) +
  labs(x="소성실 장단비", y="가마수량")

#0.25 단위
ggplot() +
  geom_histogram(data = df,
                 aes(x=소성실장단비),
                 binwidth = 0.25,
                 color="black") +
  theme_bw() +
  scale_y_continuous(breaks = c(0:15)) +
  labs(x="소성실 장단비", y="가마수량")