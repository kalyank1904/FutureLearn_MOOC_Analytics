datasets <- cache("raw_data")

cache(
  "enrolments",
  datasets[grepl("enrolments", names(datasets))]
)

cache(
  "question_response",
  datasets[grepl("question-response", names(datasets))]
)

cache(
  "sentiment",
  datasets[grepl("weekly-sentiment", names(datasets))]
)
