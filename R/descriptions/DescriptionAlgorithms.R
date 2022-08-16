# Title     : DescriptionAlgorithms.R
# Objective : The descriptions of generic symbols of algorithms
# Created by: greyhypotheses
# Created on: 12/08/2022


DescriptionAlgorithms <- function () {

  terms <- c('$i, n$', '$x_{i}$', '$\\mathbf{\\delta}(x_{i})$', '$\\mathbf{\\beta}$', '$Y_{i}$', '$p_{i}$')

  descriptions <- c(
    '$i$ denotes the $i^{th}$ observation, and $n$ is the number of observations.  Hence, $i = 1, \\ldots, n$.',
    'The location of the $i^{th}$ observation',
    'A vector of terms that depend on zero or more independent variables at location $x_{i}$',
    'The vector of regression coefficients vis-$\\grave{a}$-vis $\\mathbf{\\delta}(x_{i})$',
    'The outcome at location $x_{i}$',
    'The prevalence $\\nu_{i}/e_{i}$ wherein $\\nu$ is the $\\#$ of positives, and $e_{i}$ is the $\\#$ of examinations, at location $x_{i}$')

  frame <- data.frame(term = terms, description = descriptions)

  return(frame)

}


