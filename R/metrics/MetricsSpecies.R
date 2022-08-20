# Title     : MetricsSpecies.R
# Objective : Metrics Species
# Created by: greyhypotheses
# Created on: 21/08/2022

MetricsSpecies <- function () {

  # Disease names, labels
  diseases <- c('Ascariasis', 'Trichuriasis', 'Hookworm disease')
  labels <- c('Ascariasis', 'Trichuriasis', '\\makecell[l]{Hookworm, disease}')
  names <- data.frame(disease = diseases, labels = labels)

  # The disability ajusted life years per 100,000 inhabitants
  daly <- read.csv(file = 'data/daly_level_4.csv') %>%
    dplyr::filter(disease %in% diseases)
  daly <- dplyr::rename(daly, daly.lower = lower, daly.upper = upper)

  # The prevalence per 1000,000 inhabitants
  prevalence <- read.csv(file = 'data/prev_level_4.csv') %>%
    dplyr::filter(disease %in% diseases)
  prevalence <- dplyr::rename(prevalence, prevalence.lower = lower, prevalence.upper = upper)

  # Collating
  frame <- dplyr::full_join(x = daly, y = prevalence, by = 'disease')
  frame <- dplyr::left_join(x = names, y = frame, by = 'disease')
  frame$disease <- NULL

  return(frame)

}