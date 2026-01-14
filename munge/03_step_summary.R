step_col <- intersect(
  names(step_activity_clean),
  c("step", "step_title", "step_url", "step_id")
)[1]

step_summary <- step_activity_clean %>%
  count(.data[[step_col]], sort = TRUE)

cache("step_summary", step_summary)

# DESCRIPTIVE STATISTICS
library(skimr)
skim(step_activity_clean)