# Title     : DescriptionSpecies.R
# Objective : The description of the species.
# Created by: greyhypotheses
# Created on: 07/06/2022

DescriptionSpecies <- function() {

  species <- c(
    'Ascaris lumbricoides', 'Ancylostoma duodenale, Necator americanus', 'Trichuris trichiura')

  name <- c(
    'Roundworm',
    'Hookworms',
    'Whipworm')

  frame <- data.frame(species = species, name = name)

  return(frame)

}