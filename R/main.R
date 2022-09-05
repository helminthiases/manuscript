# Title     : main.R
# Objective : main
# Created by: greyhypotheses
# Created on: 05/09/2022


# import results
source(file = 'R/import.R')

# create book
bookdown::render_book(input = 'manuscript', output_file = 'manuscript.pdf', output_dir = '../',
                      output_yaml = 'manuscript/_output.yml')
