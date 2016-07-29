# Function to derive roughness index from raster DEM.
#
# Notes:
# Returns raster object for R and writes file to disk.
# Works fine as long as you have no NA's in your DEM.
#
# elev = R raster Object
# nb.size = neighborhood size for roughness calculation (must be odd number)
# writePath = *optional* full path for saving roughness raster (filename + extension included)

roughness <- function(elev, nb.size=3, writePath=NA) {
  library(raster)
  nb.rough <- function(x) (max(x) - min(x)) / res(elev)
  m <- matrix(1, ncol=nb.size, nrow=nb.size)
  r <- focal(elev, w=m, fun=nb.rough)
  if (!is.na(writePath)) writeRaster(r, writePath)
  return(r)
}

# Example:
# setwd("/Users/johnny_science/important_research")
# elev <- raster("srtm_64_05.tif")
# rough_3 <- roughness(elev, writePath="srtm_64_05_rough3.tif")
# rough_5 <- roughness(elev, nb.size=5, writePath="srtm_64_05_rough5.tif")