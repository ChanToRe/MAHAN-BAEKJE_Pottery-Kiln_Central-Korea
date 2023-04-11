library(ggplot2)

df <- read.csv("/Users/jch/Documents/github/P3K-HB_Pottery-Kiln/Data/Size_DO.csv")
df <- na.omit(df)

#1 단위
ggplot() +
  geom_histogram(data = df,
                 aes(x=소성실장단비),
                 binwidth = 1,
                 color="black") +
  theme_bw() +
  scale_y_continuous(breaks = c(0:15)) +
  labs(x="소성실 장단비", y="가마수량")

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

#0.1 단위
ggplot() +
  geom_histogram(data = df,
                 aes(x=소성실장단비),
                 binwidth = 0.1,
                 color="black") +
  theme_bw() +
  scale_y_continuous(breaks = c(0:15)) +
  labs(x="소성실 장단비", y="가마수량")

#0.7 단위
ggplot() +
  geom_histogram(data = df,
                 aes(x=소성실장단비),
                 binwidth = 0.7,
                 color="black") +
  theme_bw() +
  scale_y_continuous(breaks = c(0:15)) +
  labs(x="소성실 장단비", y="가마수량")