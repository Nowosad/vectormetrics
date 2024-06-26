% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_l_proxim_mn.R
\name{vm_l_proxim_mn}
\alias{vm_l_proxim_mn}
\title{Proximity Index(vector data)}
\usage{
vm_l_proxim_mn(landscape, n = 1000)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{n}{number of grid points to generate}
}
\value{
the function returns tibble with the calculated values in column "value",
this function returns also some important information such as level, class, patch id and metric name.
}
\description{
Calculate Proximity Index
}
\details{
ratio between average distance from all points of equal-area circle to its center and average distance from all points of shape to its center
}
\examples{
vm_l_proxim_mn(vector_landscape, n = 1000)
}
\references{
Angel, S., Parent, J., & Civco, D. L. (2010). Ten compactness properties of circles: Measuring shape in geography: Ten compactness properties of circles.
The Canadian Geographer / Le Géographe Canadien, 54(4), 441–461. https://doi.org/10.1111/j.1541-0064.2009.00304.x
}
