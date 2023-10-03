<img src="https://user-images.githubusercontent.com/64909586/186408061-58a88e85-be08-47f2-b3b3-2c9e04a9dec6.png" height=65><img src="https://github.com/ChanToRe/RCDB/assets/64909586/d30fb665-14a7-4290-9ab3-7dba9345fe71" height=65>

# 중부지역 마한・백제 대옹 소성 가마의 생산과 유통

---

## 소개
이 레포지토리는 제20회 매산기념강좌에서 발표된 ｢중부지역 마한・백제 대옹 소성 가마의 생산과 유통｣의 데이터, 그래프, 코드를 정리한 레포지토리입니다. 해당 논문은 아래에서 확인하실 수 있습니다.

[윤예주・주찬혁, 2023, ｢중부지역 마한・백제 대옹 소성 가마의 생산과 유통｣, 『제20회 매산기념강좌 자료집』, 숭실대학교 한국기독교박물관.](https://museum.ssu.ac.kr/%ED%95%99%EC%88%A0%EB%8F%84%EC%84%9C%EB%B0%9C%EA%B0%84/%EB%A7%A4%EC%82%B0%EA%B8%B0%EB%85%90%EA%B0%95%EC%A2%8C%EC%9E%90%EB%A3%8C%EC%A7%91/#)

레포지토리는 3개의 디렉토리로 구성되어 있습니다. `Data`에는 연구에 사용된 데이터가 있고, `Script`에는 분석 및 그래프 산출을 위한 R코드가 있으며, `Graph`에는 최종적으로 산출된 도면이 있습니다.

---

## 파일구조

```
📦MAHAN-BAEKJE_Pottery-Kiln_Central-Korea
 ┣ 📂Data
 ┃ ┣ 📜DO_in_Kiln.csv
 ┃ ┣ 📜DO_in_Settle.csv
 ┃ ┣ 📜Num_Of_DOKiln.csv
 ┃ ┣ 📜Original_Size_Of_DO.csv
 ┃ ┣ 📜Pottery_in_Kiln.csv
 ┃ ┣ 📜Site_Coordinate.csv
 ┃ ┗ 📜Size_Of_Kiln.csv
 ┣ 📂Graph
 ┃ ┣ 📜Fig_1.tif
 ┃ ┣ 📜Fig_10.tiff
 ┃ ┣ 📜Fig_11.tiff
 ┃ ┣ 📜Fig_12.tif
 ┃ ┣ 📜Fig_13.tif
 ┃ ┣ 📜Fig_15.tiff
 ┃ ┣ 📜Fig_17-1.tiff
 ┃ ┣ 📜Fig_17-2.tiff
 ┃ ┣ 📜Fig_17-3.tiff
 ┃ ┣ 📜Fig_17-4.tiff
 ┃ ┣ 📜Fig_17-5.tiff
 ┃ ┣ 📜Fig_3-1.tiff
 ┃ ┣ 📜Fig_3-2.tiff
 ┃ ┣ 📜Fig_4.tiff
 ┃ ┣ 📜FIg_5.tif
 ┃ ┣ 📜Fig_6.tiff
 ┃ ┣ 📜Fig_7.tif
 ┃ ┣ 📜Fig_8.tiff
 ┃ ┗ 📜Fig_9.tif
 ┣ 📂Script
 ┃ ┣ 📜Fig15_DoOfSettlement(All).R
 ┃ ┣ 📜Fig17_DoOfSettlement(Area).R
 ┃ ┣ 📜Fig3_TypeOfKiln(Area).R
 ┃ ┣ 📜Fig4_SizeOfKilns(Type).R
 ┃ ┣ 📜Fig6_PCAOfDO.R
 ┃ ┣ 📜Fig8_SizeOfKilns(Area).R
 ┃ ┗ 📜Fig9_NumofDOKiln.R
 ┣ 📜.gitignore
 ┗ 📜README.md
 ```

---

## 패키지 및 버전

```
R version 4.3.1 (2023-06-16 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 11 x64 (build 22621)

Matrix products: default


locale:
[1] LC_COLLATE=Korean_Korea.utf8  LC_CTYPE=Korean_Korea.utf8 

[3] LC_MONETARY=Korean_Korea.utf8 LC_NUMERIC=C               

[5] LC_TIME=Korean_Korea.utf8

time zone: Asia/Seoul
tzcode source: internal

attached base packages:
[1] grid      stats     graphics  grDevices utils     datasets  methods
[8] base

other attached packages:
 [1] lubridate_1.9.2 forcats_1.0.0   stringr_1.5.0   dplyr_1.1.2
 [5] purrr_1.0.1     readr_2.1.4     tidyr_1.3.0     tibble_3.2.1
 [9] tidyverse_2.0.0 ggalt_0.4.0     patchwork_1.1.2 car_3.1-2
[13] carData_3.0-5   ggbiplot_0.55   scales_1.2.1    plyr_1.8.8
[17] devtools_2.4.5  usethis_2.2.2   httr_1.4.6      showtext_0.9-6
[21] showtextdb_3.0  sysfonts_0.8.8  here_1.0.1      ggplot2_3.4.2

loaded via a namespace (and not attached):
 [1] gtable_0.3.3       htmlwidgets_1.6.2  remotes_2.4.2.1    processx_3.8.2
 [5] tzdb_0.4.0         callr_3.7.3        vctrs_0.6.3        tools_4.3.1
 [9] ps_1.7.5           generics_0.1.3     fansi_1.0.4        pkgconfig_2.0.3
[13] KernSmooth_2.23-21 RColorBrewer_1.1-3 lifecycle_1.0.3    compiler_4.3.1
[17] proj4_1.0-12       munsell_0.5.0      ash_1.0-15         httpuv_1.6.11
[21] htmltools_0.5.5    maps_3.4.1         Rttf2pt1_1.3.12    extrafontdb_1.0
[25] later_1.3.1        pillar_1.9.0       crayon_1.5.2       urlchecker_1.0.1
[29] MASS_7.3-60        ellipsis_0.3.2     cachem_1.0.8       sessioninfo_1.2.2
[33] abind_1.4-5        mime_0.12          tidyselect_1.2.0   digest_0.6.33
[37] stringi_1.7.12     extrafont_0.19     rprojroot_2.0.3    fastmap_1.1.1
[41] colorspace_2.1-0   cli_3.6.1          magrittr_2.0.3     pkgbuild_1.4.2
[45] utf8_1.2.3         withr_2.5.0        prettyunits_1.1.1  promises_1.2.0.1
[49] timechange_0.2.0   hms_1.1.3          memoise_2.0.1      shiny_1.7.4.1
[53] miniUI_0.1.1.1     profvis_0.3.8      rlang_1.1.1        Rcpp_1.0.11
[57] xtable_1.8-4       glue_1.6.2         pkgload_1.3.2.1    jsonlite_1.8.7
[61] R6_2.5.1           fs_1.6.3
```

대부분의 패키지는 `install.packages()` 명령어를 통해 설치할 수 있습니다. 다만, `ggbiplot` 패키지의 경우 `devtools` 패키지를 설치한 후, 아래의 명령어를 통해 설치할 수 있습니다.

```R
library(devtools)
install_github("vqv/ggbiplot")
```

---

## License

CC-BY 3.0