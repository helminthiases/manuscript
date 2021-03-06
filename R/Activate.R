# Title     : Activate.R
# Objective : Activate
# Created by: greyhypotheses
# Created on: 06/06/2022


Activate <- function () {

  packages <- c('tidyverse', 'moments', 'rmarkdown', 'latex2exp', 'mapview',
                'roxygen2', 'kableExtra', 'bookdown', 'sf', 'raster', 'tmap', 'terra',
                'spData', 'tidygeocoder', 'rnaturalearth', 'geodata', 'leaflet',
                'splancs', 'paletteer', 'ggthemes', 'ggcorrplot')

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE)
    if (x == 'rmarkdown') {library(tinytex)}
  }
  lapply(packages[!(packages %in% c('tidyverse', 'terra', 'sf', 'raster', 'tmap', 'terra', 'spData',
                                    'tidygeocoder', 'rnaturalearth', 'geodata', 'leaflet', 'splancs',
                                    'paletteer', 'ggthemes', 'ggcorrplot'))], .activate)

  # Special Case
  if ('tidyverse' %in% packages) {
    lapply(X = c('magrittr', 'dplyr', 'tibble', 'ggplot2', 'stringr', 'lubridate'), .activate)
  }

  # Active libraries
  sessionInfo()

}