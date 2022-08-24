# Title     : RateDALY.R
# Objective : DALY rates
# Created by: greyhypotheses
# Created on: 19/08/2022


RateDALY <- function () {

  frame <- read.csv(file = 'data/daly_level_3.csv')

  frame <- frame %>%
    dplyr::arrange(desc(daly_per_100k)) %>%
    dplyr::mutate(index = seq_len(nrow(frame)), .before = 1)

  # The top 9 only
  excerpt <- frame[frame$index < 10, ]

  # Caption, CML: Cutaneous and mucocutaneous leishmaniasis
  caption <- "DALY: Disability Adjusted Life Years,  INI: Intestinal Nematode Infections [geohelminths], NTD: Neglected Tropical
  Disease.  Data Source: Institute for Health Metrics & The Lancet Global Burden of Disease 2019."

  # Graph
  diagram <- ggplot(data = excerpt, mapping = aes(x = index, y = daly_per_100k)) +
    geom_linerange(mapping = ggplot2::aes(ymin = lower, ymax = upper)) +
    geom_pointrange(mapping = aes(ymin = lower, ymax = upper)) +
    theme_minimal() +
    theme(plot.caption = element_text(vjust = 1.0, hjust = 0, size = 10, colour = 'darkgrey',
                                      margin = margin(t = 8, r = 0, b = 0, l = 0, unit = 'pt')),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_line(size = 0.05),
          axis.text.x = element_blank(), axis.text.y = element_text(size = 9),
          axis.title.x = element_text(size = 11), axis.title.y = element_text(size = 11)) +
    xlab(label = '\nneglected tropical disease\n') +
    ylab(label = '\nDALY per 100k\n') +
    labs(caption = str_wrap(caption, width = 75) ) +
    ylim(-9.5, 60) +
    annotate(geom = 'text', x = 0.185 + excerpt$index, y = 8.5 + excerpt$daly_per_100k,
             label = excerpt$disease, angle = 90, size = 3, colour = 'black', alpha = 0.6)
  print(diagram)

  ggsave(filename = file.path(getwd(), 'R', 'graphs', 'RateDALY.pdf'), width = 540, height = 290, units = 'px',
         plot = diagram, dpi = 95, scale = 1)

}