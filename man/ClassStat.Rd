% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ClassStat.R
\name{ClassStat}
\alias{ClassStat}
\title{Landscape Class Statistics}
\usage{
ClassStat(mat, cellsize = 1, bkgd = NA, latlon = FALSE)
}
\arguments{
\item{mat}{A matrix of data with patches identified as classes (unique
integer values) as e.g., a binary landscape of a species
distribution or a vegetation map. Matrix can be a raster of
or class "asc" (adehabitat package), "RasterLayer" (raster package)
"SpatialGridDataFrame" (sp package)}

\item{cellsize}{Cell size (in meters) is a single value representing the
width/height of cell edges (assuming square cells)}

\item{bkgd}{Background value for which statistics will not be calculated}

\item{latlon}{Boolean value representing if the data is geographic. If
latlon == TRUE, Matrix must be of class "asc", "RasterLayer"
or "SpatialGridDataFrame"}
}
\value{
a data.frame with all available landscape metrics
}
\description{
Class-level landscape metrics
}
\details{
Available landscape metrics
\itemize{
\item class - A particular patch type from the original input matrix
\item n.patches - the number of patches of a particular patch type or in a class.
\item total.area - the sum of the areas (m2) of all patches of the corresponding patch type.
\item prop.landscape - the proportion of the total landscape represented by this class
\item patch.density - the numbers of patches of the corresponding patch type divided by
total landscape area (m2).
\item total.edge - the total edge length of a particular patch type.
\item edge.density - edge length on a per unit area basis that facilitates
comparison among landscapes of varying size.
\item landscape.shape.index - a standardized measure of total edge or edge density
that adjusts for the size of the landscape.
\item largest.patch.index - largest patch index quantifies the percentage of
total landscape area comprised by the largest patch.
\item mean.patch.area - average area of patches.
\item sd.patch.area - standard deviation of patch areas.
\item min.patch.area - the minimum patch area of the total patch areas.
\item max.patch.area - the maximum patch area of the total patch areas.
\item perimeter.area.frac.dim - perimeter-area fractal dimension equals 2
divided by the slope of regression line obtained by
regressing the logarithm of patch area (m2) against
the logarithm of patch perimeter (m).
\item mean.perim.area.ratio - the mean of the ratio patch perimeter. The
perimeter-area ratio is equal to the ratio of the patch
perimeter (m) to area (m2).
\item sd.perim.area.ratio - standard deviation of the ratio patch perimeter.
\item min.perim.area.ratio - minimum perimeter area ratio
\item max.perim.area.ratio - maximum perimeter area ratio.
\item mean.shape.index - mean of shape index
\item sd.shape.index - standard deviation of shape index.
\item min.shape.index - the minimum shape index.
\item max.shape.index - the maximum shape index.
\item mean.frac.dim.index - mean of fractal dimension index.
\item sd.frac.dim.index - standard deviation of fractal dimension index.
\item min.frac.dim.index - the minimum fractal dimension index.
\item max.frac.dim.index - the maximum fractal dimension index.
\item total.core.area - the sum of the core areas of the patches (m2).
\item prop.landscape.core - proportional landscape core
\item mean.patch.core.area - mean patch core area.
\item sd.patch.core.area - standard deviation of patch core area.
\item min.patch.core.area - the minimum patch core area.
\item max.patch.core.area - the maximum patch core area.
\item prop.like.adjacencies - calculated from the adjacency matrix, which
shows the frequency with which different pairs
of patch types (including like adjacencies between
the same patch type) appear side-by-side on the map
(measures the degree of aggregation of patch types)
\item aggregation.index - computed simply as an area-weighted mean class
aggregation index, where each class is weighted by its
proportional area in the landscape.
\item landscape.division.index - based on the cumulative patch area distribution
and is interpreted as the probability that two randomly
chosen pixels in the landscape are not situated in the
same patch
\item splitting.index - based on the cumulative patch area distribution and is
interpreted as the effective mesh number, or number of patches
with a constant patch size when the landscape is subdivided into
S patches, where S is the value of the splitting index.
\item effective.mesh.size - equals 1 divided by the total landscape area (m2) multiplied by
the sum of patch area (m2) squared, summed across all patches in
\item patch.cohesion.index - measures the physical connectedness of the corresponding patch type.
}
}
\note{
ClassStat calculates the class statistics for patch types identified
in a matrix of data or in a raster of class "asc" (adehabitat
packages), "RasterLayer" (raster package) or "SpatialGridDataFrame" (sp
package). The class statistics are based on statistics calculated by fragstats
}
\examples{
library(raster)
library(sp)
# define a simple binary matrix
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
					
#perform connected component labelling
( ccl.mat = connected.pixels(tmat) )
image(t(ccl.mat[10:1,]),col=c("grey",rainbow(length(unique(ccl.mat))-1)))

#calculate the patch statistics
( ps.data = PatchStat(ccl.mat) )

#calculate the class statistics
( cl.data = ClassStat(tmat) )

#identify background data is 0
( cl.data = ClassStat(tmat,bkgd=0) )

}
\references{
McGarigal, K., S. A. Cushman, M. C. Neel, and E. Ene. 2002.
FRAGSTATS: Spatial Pattern Analysis Program for Categorical Maps. Computer
software program produced by the authors at the University of Massachusetts,
Amherst.
}
\author{
Jeremy VanDerWal (depreciated/orphaned SDMTools package) and Jeffrey S. Evans
}
