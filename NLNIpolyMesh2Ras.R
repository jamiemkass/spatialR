# For converting polygon mesh data from Japan National Land Numerical Information (国土数値情報) to RasterStack
# mesh = polygon mesh as SpatialPolygonsDataFrame
# nr = number of rows for output raster (you'll need to count -- sorry!)
# nc = number of columns for output raster (you'll need to count -- sorry!)
# vars = vector of variable names for output RasterStack (these come from the attribute table of the mesh)

NLNIpoly2Ras <- function(mesh, nr, nc, vars) {
  e <- extent(mesh)
  r <- raster(e, nrow=nr, ncol=nc)
  s <- stack()
  for (i in vars) {
    x <- rasterize(mesh, r, field=i)
    s <- addLayer(s, x)
  }
  names(s) <- vars
  return(s)
}