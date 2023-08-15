library(ggplot2)
library(showtext)
library(sysfonts)
library(tidyverse)
library(here)

#font_add_google('Nanum Gothic', family='NanumGothic')
#showtext_auto()
#par(family="NanumGothic")

df <- read.csv(here("./Data/DO_in_Settle.csv"), fileEncoding="euc-kr")

df <- df[!(df$유역 == ""), ]
df <- df[!(df$유구성격 == ""), ]

Type_palette <- c('구상유구'='#DBA901',
                  '기타'='#74DF00',
                  '분묘'='#01DFD7',
                  '수혈'='#2E64FE',
                  '주거지'='#848484')

all_pie <- data.frame(
  Type = c("구상유구", "기타",  "분묘", "수혈", "주거지"),
  value = c(length(which(df$유구성격 == "구상유구")),
            length(which(df$유구성격 == "기타")),
            length(which(df$유구성격 == "분묘")),
            length(which(df$유구성격 == "수혈")),
            length(which(df$유구성격 == "주거지"))),
  percent = c(round(prop.table((table(df$유구성격)))*100))
)

all_pie_check <- all_pie %>% 
  mutate(csum = rev(cumsum(rev(percent))), 
         pos = percent/2 + lead(csum, 1),
         pos = if_else(is.na(pos), percent/2, pos))

ggplot(all_pie, aes(x='', y=value, fill=Type)) +
  geom_bar(stat='identity') +
  coord_polar('y', start=0) +
  geom_text(aes(x=1.3, label = paste0(round(value), "(", percent, "%", ")")),
            position = position_stack(vjust=0.5),
            colour = 'black', size = 5.5) +
  labs(x = NULL, y = NULL, title = "전체") +
  scale_fill_manual(values=Type_palette) +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(vjust = -5, hjust=0.5),
        title = element_text(size=20),
        legend.text = element_text(size=11, color="black"))
ggsave(here("./Graph/Fig_15.png"), dpi=150, width=5, height=5, units='in')
