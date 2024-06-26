% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_p_cai.R
\name{vm_p_cai}
\alias{vm_p_cai}
\title{Core area index(vector data)}
\usage{
vm_p_cai(landscape, class_col = NULL, patch_col = NULL, edge_depth)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class_col}{the name of the class column of the input landscape}

\item{patch_col}{the name of the id column of the input landscape}

\item{edge_depth}{the fixed distance to the edge of the patch}
}
\value{
the function returns tibble with the calculated values in column "value",
this function returns also some important information such as level, class, patch id and metric name.
}
\description{
This function allows you to calculate the ratio of the core area and the area in square meters.
Core area is defined as an area that within the patch and its edge is a fixed value from the boundary of the patch.
The index describes the percentage of a patch that is core area.
}
\examples{
vm_p_cai(vector_patches, "class", "patch", edge_depth = 0.8)
}
