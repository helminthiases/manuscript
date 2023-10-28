# Title     : playground.R
# Objective : Playground
# Created by: greyhypotheses
# Created on: 26/08/2022


par(bty = 'n', fg = 'grey')


#' Bayes
#'
#'
bayes <- readRDS(file = file.path(getwd(), 'warehouse', 'models', 'nugget', 'blb', 'A', 'estimations.rds'))


# Patches
dens.plot(bayes$model, param = 'beta', component.beta = 1, hist = FALSE) %>% title(xlab = expression(beta~' '[0]))
dens.plot(bayes$model, param = 'beta', component.beta = 2, hist = FALSE) %>% title(xlab = expression(beta~' '[1]))
dens.plot(bayes$model, param = 'beta', component.beta = 3, hist = FALSE) %>% title(xlab = expression(beta~' '[2]))
dens.plot(bayes$model, param = 'beta', component.beta = 4, hist = FALSE) %>% title(xlab = expression(beta~' '[3]))




# The number of coefficients
N <- dim(bayes$model$D)[2]

# Trace Plots: Coefficients
for (i in seq_len(N)) {
  trace.plot(bayes$model, param = 'beta', component.beta = i)
}

# Trace Plots: Scale/Variance Parameters
for (i in c('sigma2', 'phi', 'tau2')) {
  trace.plot(bayes$model, param = i)
}

# Density Plots: Coefficients
for (i in seq_len(N)) {
  dens.plot(bayes$model, param = 'beta', component.beta = i, hist = FALSE)
}

# Density Plots: Scale/Variance Parameters
for (i in c('sigma2', 'phi', 'tau2')) {
  dens.plot(bayes$model, param = i, hist = FALSE)
}




#' MCML
#'
#' @note mar = c(bottom, left, top, right)
#'
mcml <- readRDS(file = file.path(getwd(), 'warehouse', 'models', 'nugget', 'blm', 'A', 'estimations.rds'))
paste0(round(mcml$coefficients[2, 'est'], digits = 3),
       'piped_sewer + ',
       round(mcml$coefficients[3, 'est'], digits = 3), 'piped_sewer^2')

midpoints <- mcml$model$samples %>% colMedians()

graphics::par(mar = c(6, 5, 2, 2) )
qqnorm(y = midpoints, main = NULL, frame.plot = FALSE)
qqline(y = midpoints)

ggplot(data = data.frame(sample = midpoints), aes(sample = sample)) +
  stat_qq() +
  stat_qq_line() +
  theme_minimal() +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_line(size = 0.05),
        axis.title.x = element_text(size = 11), axis.title.y = element_text(size = 11),
        axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 10)) +
  xlab(label = '\nTheoretical Quantiles\n') +
  ylab(label = '\nSample Quantiles\n')



#' GLMM Effects
#'
estimations <- readRDS(file = file.path(getwd(), 'warehouse', 'effects', 'architectures', 'A', 'estimations.rds'))
estimations$randomgraph_
estimations$random[1, 'deviation']

