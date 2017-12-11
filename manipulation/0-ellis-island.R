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


# ---- declare-globals ---------------------------------------------------------

nlsy_79_folder <- "./data-unshared/raw/nlsy79-gender-income-2017-12-10/"
path_input_79_data  <- paste0(nlsy_79_folder,"nlsy79-gender-income-2017-12-10.dat")
path_input_79_script <-paste0(nlsy_79_folder,"nlsy79-gender-income-2017-12-10.R")


# ---- load-data ---------------------------------------------------------------
# load the NLSY79 cohort
# NOTE: YOU MUST DISABLE line (6) that reads in the file. Read it in here
new_data <- read.table(path_input_79_data, sep=' ')
source(path_input_79_script)


ds_79 <- new_data
ds_79_factors <- categories

View(ds_79)

# ---- define-utility-functions ---------------

# ---- save-to-disk ----------------------------

# save to disk 
saveRDS(new_data, path_output)

