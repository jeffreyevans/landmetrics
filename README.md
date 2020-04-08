# landmetrics 0.1-0
Legacy landscape metrics

landmetrics R package with utilities to support analysis of landscpae pattern
legacy functions and C++ code from the spatialEco package
 
# Available functions in landmetrics 0.1-0 are:

focal.lmetrics - Landscape metrics using a focal window

```r
library(raster)
library(sp)

r <- raster(nrows=180, ncols=360, xmn=571823.6, xmx=616763.6, ymn=4423540, 
            ymx=4453690, resolution=270, crs = CRS("+proj=utm +zone=12 +datum=NAD83 
            +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0"))

r[] <- rpois(ncell(r), lambda=1)
r <- calc(r, fun=function(x) { x[x >= 1] <- 1; return(x) } )  

# proportion landscape class   
pland <- focal.lmetrics(r, w=11)
  plot(pland)

# Aggregation index 
ai <- focal.lmetrics(r, w=11, metric = "aggregation.index")
  plot(ai)
  
```
 
land.metrics - Calculates a variety of landscape metrics, on binary rasters, for polygons or points with a buffer 
distance. This is similar to the moving window in Fragstats but, uses either a buffer for each 
point or a zonal approach with polygons, to derive local metrics. 

```r
library(raster)
library(sp)

r <- raster(nrows=180, ncols=360, xmn=571823.6, xmx=616763.6, ymn=4423540, 
            ymx=4453690, resolution=270, crs = CRS("+proj=utm +zone=12 +datum=NAD83 
            +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0"))

 r[] <- rpois(ncell(r), lambda=1)
   r <- calc(r, fun=function(x) { x[x >= 1] <- 1; return(x) } )  
     x <- sampleRandom(r, 10, na.rm = TRUE, sp = TRUE)

# calculate landscape metrics
lmet <- c("prop.landscape", "edge.density", "prop.like.adjacencies", "aggregation.index") 
( class.1 <- land.metrics(x=x, y=r, bw=1000, bkgd = 0, metrics = lmet) )
( all.class <- land.metrics(x=x, y=r, bw=1000, bkgd = NA, metrics = lmet ) )

# Pull metrics associated with class "0"
all.class[["0"]]
```
Please note that this package is for analytical continuity for those that previously 
derived landscape metrics in spatialEco. For domain consistency, please use the 
landscpaemetrics package (https://r-spatialecology.github.io/landscapemetrics/) 
This is a drop in replacement for FRAGSTATS and consistent in methodology and 
results. 

# Here are worked examples for the landscapemetrics package

```r
library(landscapemetrics)
library(raster)
  data(landscape)
```

# To replicate the land.metrics function 

```r
points <- matrix(c(10, 5, 25, 15, 5, 25), 
                 ncol = 2, byrow = TRUE)

sample_lsm(landscape, y = points, size = 10, 
           level = "landscape", type = "diversity metric", 
           classes_max = 3,
           verbose = FALSE)   
```

# and, for focal.lmetrics
```r
s <- matrix(1, nrow = 3, ncol = 3)
( result <- do.call(stack, window_lsm(landscape, window = s, 
                  what = c("lsm_l_pr", "lsm_l_joinent"))) )
  plot(result)
```   

**Bugs**: Users are encouraged to report bugs here. Go to [issues](https://github.com/jeffreyevans/landmetrics/issues) in the menu above, and press new issue to start a new bug report, documentation correction or feature request. You can direct questions to <jeffrey_evans@tnc.org>.

**This package will not be distributed on CRAN** 

**For the current version, run the following (requires the remotes package):**
`remotes::install_github("jeffreyevans/landmetrics")`
