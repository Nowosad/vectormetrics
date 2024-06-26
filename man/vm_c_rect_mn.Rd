% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_c_rect_mn.R
\name{vm_c_rect_mn}
\alias{vm_c_rect_mn}
\title{Rectangularity(vector data)}
\usage{
vm_c_rect_mn(landscape, class_col)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class_col}{the name of the class column of the input landscape}
}
\value{
the function returns tibble with the calculated values in column "value",
this function returns also some important information such as level, class, patch id and metric name.
}
\description{
Calculate rectangularity
}
\details{
ratio between area of shape and its minimum area bounding rectangle (MABR)
}
\examples{
vm_c_rect_mn(vector_landscape, "class")
}
\references{
Jiao, L., Liu, Y., & Li, H. (2012). Characterizing land-use classes in remote sensing imagery by shape metrics.
ISPRS Journal of Photogrammetry and Remote Sensing, 72, 46–55. https://doi.org/10.1016/j.isprsjprs.2012.05.012
}
