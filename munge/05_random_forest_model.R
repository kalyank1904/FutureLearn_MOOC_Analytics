library(caret)

model_data <- step_summary %>%
  rename(step = 1, interactions = n) %>%
  mutate(
    engagement_level = case_when(
      interactions >= quantile(interactions, 0.75) ~ "High",
      interactions >= quantile(interactions, 0.25) ~ "Medium",
      TRUE ~ "Low"
    ),
    engagement_level = factor(engagement_level)
  )

set.seed(123)

rf_class_model <- train(
  engagement_level ~ interactions,
  data = model_data,
  method = "rf",
  trControl = trainControl(method = "cv", number = 5)
)


cache("rf_class_model", rf_class_model)

