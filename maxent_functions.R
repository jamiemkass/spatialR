# makes a nice, clean data.frame of lambdas file from a Maxent object
lambdasDF <- function(mx) {
  lambdas <- mx@lambdas[1:(length(mx@lambdas)-4)]
  data.frame(var=sapply(lambdas, FUN=function(x) strsplit(x, ',')[[1]][1]),
             coef=sapply(lambdas, FUN=function(x) as.numeric(strsplit(x, ',')[[1]][2])),
             min=sapply(lambdas, FUN=function(x) as.numeric(strsplit(x, ',')[[1]][3])),
             max=sapply(lambdas, FUN=function(x) as.numeric(strsplit(x, ',')[[1]][4])),
             row.names=1:length(lambdas))
}

selectOptModel <- function(enm.eval, criteria='seq') {
  e <- enm.eval@results
  if (criteria=='seq') {
    opt <- e[which(e$Mean.ORmin==min(e$Mean.ORmin)),]
    opt <- opt[which(opt$Mean.AUC==max(opt$Mean.AUC)),]
  }
  opt
}