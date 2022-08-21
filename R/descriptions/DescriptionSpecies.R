# Title     : DescriptionSpecies.R
# Objective : The description of the species.
# Created by: greyhypotheses
# Created on: 07/06/2022

DescriptionSpecies <- function() {

  # The diseases
  field <- c('species', 'abbr.', 'name', '\\makecell[l]{adult \\\\ inhabits}', '\\makecell[l]{infective \\\\ stage}')
  ascariasis <- c('\\makecell[l]{Ascaris \\\\ lumbricoides}', '\\makecell[l]{A.\\\\ lumbricoides}', 'Roundworm', '\\makecell[l]{small \\\\ intestine}', 'ova')
  trichuriasis <- c('\\makecell[l]{Trichuris \\\\ trichiura}', '\\makecell[l]{T.\\\\ trichiura}', 'Whipworm', '\\makecell[l]{caecum, \\\\ colon}', 'ova')
  hookworm <- c('\\makecell[l]{Ancylostoma\\\\ duodenale,\\\\ Necator\\\\ americanus}', 'A. duodenale, N. americanus', 'Hookworm', 'upper small intestine', 'larvae')

  frame <- data.frame(field = field, ascariasis = ascariasis, trichuriasis = trichuriasis, hookworm.disease = hookworm)

  return(frame)

}