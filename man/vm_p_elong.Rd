% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_p_elong.R
\name{vm_p_elong}
\alias{vm_p_elong}
\title{Elongation(vector data)}
\usage{
vm_p_elong(landscape, class_col = NULL, patch_col = NULL)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class_col}{the name of the class column of the input landscape}

\item{patch_col}{the name of the id column of the input landscape}
}
\value{
the function returns tibble with the calculated values in column "value",
this function returns also some important information such as level, class, patch id and metric name.
}
\description{
Calculate elongation of shape
}
\details{
ratio between major and minor axis length
}
\examples{
vm_p_elong(vector_patches, "class", "patch")
}
\references{
Jiao, L., Liu, Y., & Li, H. (2012). Characterizing land-use classes in remote sensing imagery by shape metrics.
ISPRS Journal of Photogrammetry and Remote Sensing, 72, 46–55. https://doi.org/10.1016/j.isprsjprs.2012.05.012
}
