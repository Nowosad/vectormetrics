% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_p_ncore.R
\name{vm_p_ncore}
\alias{vm_p_ncore}
\title{the number of disjunct core area(vector data)}
\usage{
vm_p_ncore(landscape, class, core_distance)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class}{the name of the class column of the input landscape}

\item{core_distance}{the fixed distance to the edge of the patch}
}
\value{
the returned calculated core areasnumber of disjunct core areas of all patches are in column "value",
and this function returns also some important information such as level, class, patch id and metric name.
}
\description{
This function allows you to calculate the number of disjunct core areas of all patches
Core area is defined as an area that within the patch and its edge is a fixed value from the boundary of the patch.
Disjunct core area is defined as a new discrete area(patch), which is a sub-part of core area
}
\examples{
## if the class name of input landscape is landcover,
## then write landcover in a double quotation marks as the second parameter.
vm_p_core(landscape, "landcover", core_distance = 0.8)
}