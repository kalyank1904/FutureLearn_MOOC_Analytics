step_activity_clean <- step_activity %>%
  filter(!is.na(step)) %>%      # safe filter
  mutate(
    step = as.character(step)
  )

cache("step_activity_clean", step_activity_clean)

library(ProjectTemplate)
load.project()
skimr::skim(step_activity_clean)

