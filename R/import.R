# Title     : import.R
# Objective : Imports the modelling results
# Created by: greyhypotheses
# Created on: 05/09/2022



#' URL
#'
#'

# The list of data url paths
T <- read.csv(file = 'https://raw.githubusercontent.com/helminthiases/modelling/master/warehouse/data.csv')
URL <- T$path



#' URI
#'
#'

# Split each url string at section 'master'
#   ... stringr::str_replace(string = X, pattern = '/', replacement = '')
X <- lapply(X = T$path, FUN = function (x) unlist(strsplit(x = x, split = 'master/'))[2]) %>% unlist()

# Ascertain the directory separator
X <- stringr::str_replace_all(X, pattern = '/', replacement = .Platform$file.sep)

# The local destinations
URI <- lapply(X = X, FUN = function (x) file.path(getwd(), x)) %>% unlist()



#' Prepare local directories
#'
#'

# What are the unique directories?
directories <- lapply(X = X, FUN = function (x) dirname(x)) %>% unlist() %>% unique()

setup <- function (directory){
  if (dir.exists(paths = directory)) {
    base::unlink(x = directory, recursive = TRUE)
  }
  dir.create(path = directory, recursive = TRUE)
}
lapply(X = directories, FUN = setup)



#' Unloading
#'
#'

# A function that unloads https: data files
unload <- function (url, uri) {
  httr::GET(url = url,
            httr::write_disk(path = uri, overwrite = TRUE),
            overwrite = TRUE)
}

# Unload in-parallel
cores <- parallel::detectCores() / 2
doParallel::registerDoParallel(cores = cores)
clusters <- parallel::makeCluster(cores)
parallel::clusterMap(clusters, fun = unload, URL, URI)
parallel::stopCluster(clusters)
rm(clusters, cores)
