# Title     : DescriptionExtraneous.R
# Objective : Descriptions of extraneous data
# Created by: greyhypotheses
# Created on: 11/08/2022

DescriptionExtraneous <- function () {

  terms <- c('\\makecell[l]{improved\\underline{\\hspace{0.125cm}}sewer, \\\\ unimproved\\underline{\\hspace{0.125cm}}sewer}',
             '\\makecell[l]{piped\\underline{\\hspace{0.125cm}}sewer, \\\\ unpiped\\underline{\\hspace{0.125cm}}sewer}',
             'surface\\underline{\\hspace{0.125cm}}sewer',
             '\\makecell[l]{elevation, \\\\ elevation.km}',
             '\\makecell[l]{p\\underline{\\hspace{0.125cm}}density, \\\\ p\\underline{\\hspace{0.125cm}}density.k}')

  descriptions <- c(
    "Percentage (a) \\textit{access to any improved sanitation facility}, and (b) \\textit{reliance on unimproved sanitation facilities}, respectively. (WaSH variables)",
    "Percentage (a) \\textit{access to sewer and septic sanitation facilities}, and (b) \\textit{access to a non-piped improved sanitation facility}, respectively.  (WaSH variables)",
    "Percentage \\textit{reliance on open defaecation}.  (WaSH variable)",
    "The elevation in metres and kilometre, respectively.",
    "The number of people per square kilometre, and the number of thousand people per square kilometre, respectively." )

  frame <- data.frame(term = terms, description = descriptions)

  return(frame)

}