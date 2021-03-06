% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spheroid.distance.R
\name{spheroid.distance}
\alias{spheroid.distance}
\title{Vincenty Direct Calculation of Distance and Direction}
\usage{
spheroid.distance(lat1, lon1 = NULL, lat2 = NULL, lon2 = NULL, bearing = FALSE)
}
\arguments{
\item{lat1}{a single value or vector of values representing latitude in
decimal degrees from -90 to 90 degrees. Alternatively, a
data.frame or matrix can be used here with each column
representing lat1, lon1, lat2, lon2 (in that order).}

\item{lon1}{a single value or vector of values representing longitude in
decimal degrees from -180 to 180 degrees. If NULL, lat1 is
assumed to be a matrix or data.frame.}

\item{lat2}{a single value or vector of values representing latitude in
decimal degrees from -90 to 90 degrees. If NULL, lat1 is
assumed to be a matrix or data.frame.}

\item{lon2}{a single value or vector of values representing longitude in
decimal degrees from -180 to 180 degrees. If NULL, lat1 is
assumed to be a matrix or data.frame.}

\item{bearing}{boolean value as to calculate the direction as well as the distance.}
}
\value{
Returns a data.frame with:
\itemize{
\item lon1 - the original longitude
\item lat1 - the original latitude
\item lon2 - the destination longitude
\item lat2 - the destination latitude
\item distance - the distance used
\item bearing - if requested, the bearing between the two points
}
}
\description{
Estimates the distance on a sphere using lat and long coordinates
}
\note{
The spheroid.distance estimates the distance given a starting and ending latitude
and longitude. Vincenty's approach, is described as: Vincenty's formula
are two related iterative methods used in geodesy to calculate the distance
between two points on the surface of an spheroid.
They are based on the assumption that the figure of the Earth is an oblate spheroid,
and hence are more accurate than methods such as great-circle distance which
assume a spherical Earth.
Note: this method assumes a locations are lat & lon given in WGS 84.Direction,
if requested, is the the initial bearing (sometimes referred to as forward azimuth)
which one would follow as a straight line along a great-circle arc from start
to finish. That this will fail if there are NA's in the data.
}
\references{
Vincenty, T. (1975). Direct and Inverse Solutions of Geodesics on
the Ellipsoid with application of Nested Equations. Survey Review, vol XXII
no 176.
}
\author{
Jeremy VanDerWal (depreciated/orphaned SDMTools package) and Jeffrey S. Evans
}
