# Title     : DiseasePrevalence.R
# Objective : TODO
# Created by: greyhypotheses
# Created on: 21/08/2022


DiseasePrevalence <- function (pathstr) {

  # We'll use the full names in the manuscript
  abbreviations <- list('INI' = '\\makecell[l]{Intestinal nematode \\\\ infections}',
                        'Other NTD' = '\\makecell[l]{Other Neglected \\\\ Tropical Disease}',
                        'Food-borne trematodiases' = '\\makecell[l]{Food-borne \\\\ trematodiases}')

  # The data set of neglected tropical diseases
  frame <- read.csv(file = file.path(pathstr, 'data', 'prev_level_3.csv'))

  # Arranging
  frame <- frame %>%
    dplyr::arrange(desc(prev_cases_per_100k))

  # Addressing names
  indices <- which(frame$disease %in% names(abbreviations))
  frame$disease <- base::replace(frame$disease, indices, unlist(abbreviations, use.names = FALSE))


  return(frame[1:7, ])

}