# Title     : DescriptionSpecies.R
# Objective : The description of the species.
# Created by: greyhypotheses
# Created on: 07/06/2022

DescriptionSpecies <- function() {

  species <- c('Ascaris lumbricoides', 'Ancylostoma duodenale, Necator americanus', 'Trichuris trichiura')
  name <- c('Roundworm', 'Hookworms', 'Whipworm')

  disease <- c('Ascarisis', 'Hookworm disease', 'Trichuriasis')

  inhabits <- c('small intestine', 'upper small intestine', 'caecum, colon')

  frame <- data.frame(species = species, name = name)

  return(frame)

}