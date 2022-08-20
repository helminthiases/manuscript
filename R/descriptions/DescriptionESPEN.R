# Title     : DescriptionESPEN.R
# Objective : Description ESPEN
# Created by: greyhypotheses
# Created on: 11/08/2022


DescriptionESPEN <- function () {

  terms <- c('longitude, latitude', 'year',
             '\\makecell[l]{hk\\underline{\\hspace{0.125cm}}examined, \\\\ hk\\underline{\\hspace{0.125cm}}positive}',
             '\\makecell[l]{asc\\underline{\\hspace{0.125cm}}examined, \\\\ asc\\underline{\\hspace{0.125cm}}positive}',
             '\\makecell[l]{tt\\underline{\\hspace{0.125cm}}examined, \\\\ tt\\underline{\\hspace{0.125cm}}positive}')

  descriptions <- c(
    "A site's longitude and latitude co$\\ddot{o}$rdinates.",
    "The observation's year.",
    "The number of individuals examined, and the number testing positive, respectively.$^{1}$.",
    "$ditto^{2}$",
    "$ditto^{3}$" )

  frame <- data.frame(term = terms, description = descriptions)

  return(frame)

}