# Title     : DiseasePrevalence.R
# Objective : Disease Prevalence
# Created by: greyhypotheses
# Created on: 21/08/2022



DiseasePrevalence <- function (pathstr) {


  # We'll use the full names in the manuscript
  names <- data.frame(disease = c('INI', 'Other NTD', 'Food-borne trematodiases'),
                      label = c('\\makecell[l]{Intestinal nematode \\\\ infections}',
                                '\\makecell[l]{Other Neglected \\\\ Tropical Disease}',
                                '\\makecell[l]{Food-borne \\\\ trematodiases}'))


  # The neglected tropical diseases data
  frame <- read.csv(file = file.path(pathstr, 'data', 'prev_level_3.csv'))


  # Arranging
  frame <- frame %>%
    dplyr::arrange(desc(prev_cases_per_100k))


  # Addressing names
  frame <- dplyr::left_join(x = frame, y = names, by = 'disease')
  frame$disease <- coalesce(frame$label, frame$disease)
  frame$label <- NULL


  return(frame[1:5, ])

}