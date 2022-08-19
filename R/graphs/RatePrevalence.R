# Title     : RatePrevalence.R
# Objective : Rates of prevalence
# Created by: greyhypotheses
# Created on: 18/08/2022


RatePrevalence <- function () {

  frame <- read.csv(file = file.path(getwd(), 'data', 'prev_level_3.csv'))

  frame <- frame %>%
    dplyr::arrange(desc(prev_cases_per_100k)) %>%
    dplyr::mutate(index = seq_len(nrow(frame)), .before = 1)

  # The top 9 only
  excerpt <- frame[frame$index < 10, ]

  # Caption
  caption <- "INI: Intestinal Nematode Infections [geohelminths], NTD: Neglected Tropical
  Disease.  Data Source: Institute for Health Metrics & The Lancet Global Burden of Disease 2019."

  # Graph
  diagram <- ggplot(data = excerpt, mapping = aes(x = index, y = prev_cases_per_100k)) +
    geom_linerange(mapping = ggplot2::aes(ymin = lower, ymax = upper)) +
    geom_pointrange(mapping = aes(ymin = lower, ymax = upper)) +
    coord_trans(y = scales::log10_trans()) +
    scale_y_continuous(breaks = c(0, 100, 1000, 5000, 10000)) +
    theme_minimal() +
    theme(plot.caption = element_text(vjust = 1.0, hjust = 0, size = 10, colour = 'darkgrey',
                                      margin = margin(t = 8, r = 0, b = 0, l = 0, unit = 'pt')),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_line(size = 0.05),
          axis.text.x = element_blank(), axis.text.y = element_text(size = 9),
          axis.title.x = element_text(size = 11), axis.title.y = element_text(size = 11)) +
    xlab(label = '\nneglected tropical disease\n') +
    ylab(label = expression(atop('\nprevalence per 100k [2019]', '('~log[10]~' scale)'))) +
    labs(caption = str_wrap(caption, width = 75) ) +
    annotate(geom = 'text', x = 0.185 + excerpt$index, y = 100 + excerpt$prev_cases_per_100k,
             label = excerpt$disease, angle = 90, size = 3, colour = 'black', alpha = 0.60)
  print(diagram)

  ggsave(filename = file.path(getwd(), 'R', 'graphs', 'RatePrevalence.pdf'), width = 540, height = 290, units = 'px',
         plot = diagram, dpi = 95, scale = 1)

}

