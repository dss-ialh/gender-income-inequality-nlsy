# the purpose of this script is to create a data transfer object (dto)

# run the line below to stitch a basic html output. For elaborated report, run the corresponding .Rmd file
# knitr::stitch_rmd(script="./manipulation/0-ellis-island.R", output="./manipulation/stitched-output/0-ellis-island.md")
#These first few lines run only when the file is run in RStudio, !!NOT when an Rmd/Rnw file calls it!!
rm(list=ls(all=TRUE))  #Clear the variables from previous runs.
cat("\f") # clear console

# ---- load-sources ------------------------------------------------------------
# Call `base::source()` on any repo file that defines functions needed below.  Ideally, no real operations are performed.

# ---- load-packages -----------------------------------------------------------
# Attach these packages so their functions don't need to be qualified: http://r-pkgs.had.co.nz/namespace.html#search-path
# library(tidyverse) #Pipes
  library(magrittr)

# ---- declare-globals ---------------------------------------------------------

nlsy_79_folder <- "./data-unshared/raw/nlsy79-gender-income-2017-12-10/"
path_input_79_data  <- paste0(nlsy_79_folder,"nlsy79-gender-income-2017-12-10.dat")
path_input_79_script <-paste0(nlsy_79_folder,"nlsy79-gender-income-2017-12-10.R")

nlsy_97_folder <- "./data-unshared/raw/nlsy97-gender-income-2017-12-10/"
path_input_97_data  <- paste0(nlsy_97_folder,"nlsy97-gender-income-2017-12-10.dat")
path_input_97_script <-paste0(nlsy_97_folder,"nlsy97-gender-income-2017-12-10.R")


# ---- load-data ---------------------------------------------------------------
# load the NLSY79 cohort
# NOTE: YOU MUST DISABLE line (6) that reads in the file. Instead read it in here
# enable 3 lines at the end of the automatic R script that creates 'categories' and 'new_data' objects
new_data <- read.table(path_input_79_data, sep=' ')
source(path_input_79_script)
# replace standard objects from automatic scripts with custom names
ds_79         <- new_data
ds_79_factors <- categories
# remove automatically created objects
rm(list=c("new_data","categories"))

# repeat import for NLSY97 cohort 
new_data <- read.table(path_input_97_data, sep=' ')
source(path_input_97_script)
# replace standard objects from automatic scripts with custom names
ds_97         <- new_data
ds_97_factors <- categories
# remove automatically created objects
rm(list=c("new_data","categories"))

# ---- define-utility-functions ---------------

# ---- inspect-data ---------------------------
ds_79 %>% dplyr::glimpse()
ds_79_factors %>% dplyr::glimpse()

ds_97 %>% dplyr::glimpse()
ds_97_factors %>% dplyr::glimpse()

# ---- tweak-data-79 --------------------------

# ---- tweak-data-97 --------------------------

# ---- merge-cohorts ---------------------------

# ---- save-to-disk ----------------------------
# where data transfer objects should be saved
path_save_79 <- "./data-unshared/derived/dto-raw-79.rds"
path_save_97 <- "./data-unshared/derived/dto-raw-97.rds"

saveRDS(list("data" = ds_79, "factors" = ds_79_factors))
saveRDS(list("data" = ds_79, "factors" = ds_97_factors))

