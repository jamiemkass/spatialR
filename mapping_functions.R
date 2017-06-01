# zoom to a point with specified radius
zoom2pt <- function(r, p, rad) {
# r = raster object
# p = point coordinates (lat,lon) as vector
# rad = radius (length in units of raster projection)
  ext <- c(p[1]-rad, p[1]+rad, p[2]-rad, p[2]+rad)
  plot(r, ext=ext)
  points(p[1], p[2])
}

# zoom2pt for an array of points, one at a time
zoomAround <- function(r, p, rad) {
# r = raster object
# p = point coordinates (lat,lon) as data.frame
# rad = radius (length in units of raster projection)
  np <- nrow(p)
  par(ask=TRUE)
  for (i in 1:np) {
    zoom2pt(r, p[i,], rad)
  }
  par(ask=FALSE)
}
