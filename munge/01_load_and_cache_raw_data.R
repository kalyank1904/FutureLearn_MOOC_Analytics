library(tidyverse)

data_dir <- "data/raw/MAS8600_MAS8505_02_main_report_FutureLearn_MOOC_Dataset"

step_files <- list.files(
  data_dir,
  pattern = "step-activity\\.csv$",
  full.names = TRUE
)

step_activity <- step_files %>%
  set_names(basename(.)) %>%
  map_dfr(read_csv, .id = "source_file")

cache("step_activity", step_activity)

