# Title     : DescriptionSpecies.R
# Objective : The description of the species.
# Created by: greyhypotheses
# Created on: 07/06/2022

DescriptionSpecies <- function() {

  # The diseases
  field <- c('species', 'abbreviation', 'name', 'adult inhabits', 'infective stage', '\\makecell[l]{infective organism, lives in}')
  ascariasis <- c('Ascaris lumbricoides', 'A. lumbricoides', 'Roundworm', 'small intestine', 'ova', 'environment')
  trichuriasis <- c('Trichuris trichiura', 'T. trichiura', 'Whipworm', 'caecum, colon', 'ova', 'environment')
  hookworm <- c('\\makecell[l]{Ancylostoma duodenale, Necator americanus}', 'A. duodenale, N. americanus', 'Hookworm', 'upper small intestine', 'larvae', 'environment (soil)')

  frame <- data.frame(field = field, ascariasis = ascariasis, trichuriasis = trichuriasis, hookworm.disease = hookworm)

  return(frame)

}