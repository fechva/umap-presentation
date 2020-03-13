library("umap")
library("tidyverse")

View(iris)

data <- as.matrix( iris[, c(1:4)] )

seq.umap <- umap::umap(
  d            = data,
  method       = "umap-learn",
  metric       = "euclidean",
  n_neighbors  = 15,
  min_dist     = 0.1,
  n_components = 2)

umap_coordinates <- as.data.frame(seq.umap$layout)

ggplot(data    = umap_coordinates, 
       mapping = aes(x = V1, y = V2, col = iris$Species)) +
  geom_point(alpha = 0.4, size = 3) + 
  theme_bw()

# https://umap-learn.readthedocs.io/en/latest/parameters.html#metric
# Minkowski style metrics
# 
# euclidean
# manhattan
# chebyshev
# minkowski
#
# Miscellaneous spatial metrics
# 
# canberra
# braycurtis
# haversine
#
# Normalized spatial metrics
# 
# mahalanobis
# wminkowski
# seuclidean
#
# Angular and correlation metrics
# 
# cosine
# correlation
#
# Metrics for binary data
# 
# hamming
# jaccard
# dice
# russellrao
# kulsinski
# rogerstanimoto
# sokalmichener
# sokalsneath
# yule
