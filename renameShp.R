# Function to rename shapefile (.shp) and all associated files
# fpath = full file path of any of the associated files (character)
# newName = new name for the files (character)

renameShp <- function(fpath, newName) {
  dir <- dirname(fpath)
  base <- basename(fpath)
  fname <- strsplit(base, '[.]')[[1]][1]
  ls <- list.files(path=dir, pattern=fname, full.names=TRUE)
  sapply(ls, FUN=function(p){
    file.rename(from=p, to=sub(pattern=fname,replacement=newName, p))
  })
  print(paste("Renamed", length(ls), "files."))
}