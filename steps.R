installed.packages()[, "Package"]
library(ProjectTemplate)
library(renv)
library(tidyverse)
library(skimr)
library(GGally)
library(caret)
library(randomForest)
library(e1071)
library(pROC)
library(rmarkdown)

# Install required packages 
install.packages(c(
  "ProjectTemplate", "renv", "tidyverse",
  "skimr", "GGally", "caret", "randomForest", 
  "e1071", "pROC", "rmarkdown"
))


# Create project
ProjectTemplate::create.project(
  project.name = "FutureLearn_MOOC_Analytics",
  template = "minimal"
)

setwd("C:/Users/Admin/Documents/FutureLearn_MOOC_Analytics")
getwd()



list.files()

renv::init()




library(ProjectTemplate)
class(cache)




library(tidyverse)

data_dir <- "data/raw/MAS8600_MAS8505_02_main_report_FutureLearn_MOOC_Dataset"

step_files <- list.files(
  data_dir,
  pattern = "step-activity\\.csv$",
  full.names = TRUE
)

datasets <- cache("raw_data")

cache("enrolments",
      datasets[grepl("enrolments", names(datasets))])

cache("step_activity",
      datasets[grepl("step-activity", names(datasets))])

cache("question_response",
      datasets[grepl("question-response", names(datasets))])

cache("sentiment",
      datasets[grepl("weekly-sentiment", names(datasets))])


steps_all <- step_files %>%
  set_names(basename(.)) %>%
  map_dfr(read_csv, .id = "source_file")


glimpse(steps_all)


step_col <- intersect(
  names(steps_all),
  c("step", "step_title", "step_url", "step_id")
)[1]

step_col


steps_summary <- steps_all %>%
  count(.data[[step_col]], sort = TRUE)


ggplot(
  steps_summary %>% slice_max(n, n = 20),
  aes(reorder(.data[[step_col]], n), n)
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 20 Most Active Course Steps",
    x = "Step",
    y = "Number of Interactions"
  )



library(ProjectTemplate)
load.project()

step_activity
step_activity_clean
step_summary


# DESCRIPTIVE STATISTICS
library(skimr)
skim(step_activity_clean)


