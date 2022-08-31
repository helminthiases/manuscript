# Title     : HookwormTG.R
# Objective : Hookworm Togo
# Created by: greyhypotheses
# Created on: 31/08/2022

HookwormTG <- function (pathstr) {

  # We'll use the full names in the manuscript
  names <- data.frame(metric = c('daly_per_100k', 'prev_cases_per_100k'),
                      label = c('\\makecell[l]{DALY \\\\ per 100k}',
                                '\\makecell[l]{Prevalence \\\\ per 100k}'))


  # The neglected tropical diseases data
  frame <- read.csv(file = file.path(pathstr, 'data', 'TG', 'hookworm.csv'))



  # Addressing names
  frame <- dplyr::left_join(x = names, y = frame, by = 'metric')
  frame$metric <- NULL

  return(frame)

}