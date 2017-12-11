# knitr::stitch_rmd(script="./___/___.R", output="./___/stitched-output/___.md")
#These first few lines run only when the file is run in RStudio, !!NOT when an Rmd/Rnw file calls it!!
rm(list=ls(all=TRUE))  #Clear the variables from previous runs.
cat("\f") # clear console 

# ---- load-sources ------------------------------------------------------------
# Call `base::source()` on any repo file that defines functions needed below.  Ideally, no real operations are performed.
source("./scripts/common-functions.R") # used in multiple reports
source("./scripts/graphing/graph-presets.R") # fonts, colors, themes 

# ---- load-packages -----------------------------------------------------------
# Attach these packages so their functions don't need to be qualified: http://r-pkgs.had.co.nz/namespace.html#search-path
library(magrittr) # enables piping : %>% 
library(TabularManifest) # install from devtools::install_github(repo="Melinae/TabularManifest")
# Verify these packages are available on the machine, but their functions need to be qualified: http://r-pkgs.had.co.nz/namespace.html#search-path
requireNamespace("ggplot2") # graphing
requireNamespace("tidyr") # data manipulation
requireNamespace("dplyr") # Avoid attaching dplyr, b/c its function names conflict with a lot of packages (esp base, stats, and plyr).
requireNamespace("testit")# For asserting conditions meet expected patterns.

# ---- declare-globals ---------------------------------------------------------
path_input_79 <- "./data-unshared/derived/dto-raw-79.rds"
path_input_97 <- "./data-unshared/derived/dto-raw-97.rds"

# ---- load-data ---------------------------------------------------------------
ls_79 <- readRDS(path_input_79)
ls_97 <- readRDS(path_input_97)

# view the content of imported dataset
ls_79 %>% names()
lapply(ls_79, names)


ds_79 <- ls_79$data
ds_97 <- ls_97$data

# ---- inspect-data -------------------------------------------------------------
ds_79 %>% dplyr::glimpse(90)
ds_97 %>% dplyr::glimpse(90)
# ---- tweak-data --------------------------------------------------------------

# ---- basic-table --------------------------------------------------------------

# ---- basic-graph --------------------------------------------------------------

# ---- age-distribution --------------------------------------------------------------

ds_79 %>% TabularManifest::histogram_discrete(variable_name = "AGE_1993")

ds_97 %>% TabularManifest::histogram_discrete(variable_name = "AGE_2014")


# ---- publisher ---------------------------
rmarkdown::render(
  input = "./sandbox/eda-1/eda-1.Rmd" ,
  output_format="html_document", clean=TRUE
)


