# landmetrics 0.1-0
Legacy landscape metrics

landmetrics R package with utilities to support analysis of landscpae pattern
  legacy functions and C++ code from the spatialEco package
    
# Available functions in landmetrics 0.1-0 are:

    focal.lmetrics - Landscape metrics using a focal window
 
    land.metrics - Calculates a variety of landscape metrics, on binary rasters, for polygons or points with a buffer 
                  distance. This is similar to the moving window in Fragstats but, uses either a buffer for each 
                  point or a zonal approach with polygons, to derive local metrics. 

**Bugs**: Users are encouraged to report bugs here. Go to [issues](https://github.com/jeffreyevans/landmetrics/issues) in the menu above, and press new issue to start a new bug report, documentation correction or feature request. You can direct questions to <jeffrey_evans@tnc.org>.

**This package will not be distributed on CRAN** 

**For the current version, run the following (requires the remotes package):**
`remotes::install_github("jeffreyevans/landmetrics")`
