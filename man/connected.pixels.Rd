% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connected.pixels.R
\name{connected.pixels}
\alias{connected.pixels}
\title{Connected Components Labelling}
\usage{
connected.pixels(mat)
}
\arguments{
\item{mat}{is a binary matrix of data with 0 representing background and 1
representing environment of interest. NA values are acceptable. The matrix
can be a raster of class 'asc' (this & adehabitat package), 'RasterLayer'
(raster package) or 'SpatialGridDataFrame' (sp package)}
}
\value{
A matrix of the same dim and class of mat in which unique
components (individual patches) are numbered 1:n with 0 remaining background
value.
}
\description{
Unique Patch Labelling using Connected Components
}
\note{
connected.pixels is a 1 pass implementation of connected components
labelling. Here it is applied to identify disjunct patches within a
distribution. The raster matrix can be a raster of class 'asc'
(adehabitat package), 'RasterLayer' (raster package) or
'SpatialGridDataFrame' (sp package).
}
\examples{
library(raster)
library(sp)
#define a simple binary matrix
tmat = { matrix(c( 0,0,0,1,0,0,1,1,0,1,
                   0,0,1,0,1,0,0,0,0,0,
                   0,1,NA,1,0,1,0,0,0,1,
                   1,0,1,1,1,0,1,0,0,1,
                   0,1,0,1,0,1,0,0,0,1,
                   0,0,1,0,1,0,0,1,1,0,
                   1,0,0,1,0,0,1,0,0,1,
                   0,1,0,0,0,1,0,0,0,1,
                   0,0,1,1,1,0,0,0,0,1,
                   1,1,1,0,0,0,0,0,0,1),nr=10,byrow=TRUE) }
					
# perform connected component labelling
( ccl.mat = connected.pixels(tmat) )
image(t(ccl.mat[10:1,]),col=c('grey',rainbow(length(unique(ccl.mat))-1)))

}
\references{
Chang, F., C.J. Chen, and C.J. Lu. 2004. A linear-time component-labeling algorithm 
using contour tracing technique. Comput. Vis. Image Underst. 93:206-220.
}
\author{
Jeremy VanDerWal (depreciated/orphaned SDMTools package) and Jeffrey S. Evans
}
