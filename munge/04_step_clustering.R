step_cluster_data <- step_summary %>%
  rename(step = 1, interactions = n) %>%
  mutate(interactions_scaled = scale(interactions))

set.seed(123)
kmeans_model <- kmeans(step_cluster_data$interactions_scaled, centers = 2)

step_clusters <- step_summary %>%
  mutate(cluster = factor(kmeans_model$cluster))

cache("step_clusters", step_clusters)

