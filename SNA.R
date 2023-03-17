library(igraph)
library(tidyverse)
library(tidygraph)
library(ggraph)
library(ggplot2)
library(dplyr)

### 데이터 전처리 ###
df <- read.csv('/Users/jch/Desktop/DO_Master(0317).csv')
df <- distinct(df) #공반유물 확인으로 변환
df <- na.omit(df) #결측치 제거
df <- df[, -1]
df <- df[, -2]
### 2-mode Network ###
df %>%
  as_tbl_graph() %>%
  ggraph(layout='stress') +
  geom_edge_link(color='grey', alpha=.5) +
  geom_node_point(aes(size=10), color='salmon') +
  geom_node_text(aes(label=name, size=10)) +
  theme_graph() +
  theme(legend.position='none')

### 1-mode Network(유적) ###
#컨버팅
site <- graph_from_data_frame(df)
V(site)$type <- bipartite_mapping(site)$type
site_matrix <- as_incidence_matrix(site)
site_matrix <- site_matrix %*% t(site_matrix)
diag(site_matrix) <- 0

#지표 계산
site_matrix %>%
  as_tbl_graph() %>%
  mutate(pg=centrality_pagerank()) %>%
  mutate(eig=centrality_eigen()) %>%
  mutate(group=group_infomap()) %>%
  arrange(desc(pg), desc(eig), desc(group)) %>%
  as_tibble

#그래프 산출
site_matrix %>%
  as_tbl_graph() %>%
  mutate(pg=centrality_eigen(), group=group_infomap()) %>%
  ggraph(layout='kk') +
  geom_edge_link(aes(width=weight), color="grey50", alpha=0.5) +
  scale_edge_width(range=c(0.1, 2)) +
  geom_node_point(aes(size=pg, color=as.factor(group)), color="green") +
  geom_node_text(aes(size=pg * 0.2, label=name)) +
  theme_graph() +
  theme(legend.position='none')

### 1-mode Network(유물) ###
#컨버팅
arti <- graph_from_data_frame(df)
V(arti)$type <- bipartite_mapping(arti)$type
arti_matrix <- as_incidence_matrix(arti)
arti_matrix <- t(arti_matrix) %*% arti_matrix
diag(arti_matrix) <- 0

arti_matrix %>%
  as_tbl_graph() %>%
  mutate(pg=centrality_pagerank()) %>%
  mutate(eig=centrality_eigen()) %>%
  mutate(group=group_infomap()) %>%
  arrange(desc(pg), desc(eig), desc(group)) %>%
  as_tibble

#그래프 산출
arti_matrix %>%
  as_tbl_graph() %>%
  mutate(pg=centrality_pagerank(), group=group_infomap()) %>%
  ggraph(layout='grid') +
  geom_edge_link(aes(width=weight), color="grey50", alpha=0.5) +
  scale_edge_width(range=c(0.1, 2)) +
  geom_node_point(aes(size=pg, color=as.factor(group)), color="green") +
  geom_node_text(aes(size=pg * 0.2, label=name)) +
  theme_graph() +
  theme(legend.position='none')