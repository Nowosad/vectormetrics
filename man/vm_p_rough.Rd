% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_p_rough.R
\name{vm_p_rough}
\alias{vm_p_rough}
\title{Roughness index(vector data)}
\usage{
vm_p_rough(landscape, class_col = NULL, patch_col = NULL, n = 100)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class_col}{the name of the class column of the input landscape}

\item{patch_col}{the name of the id column of the input landscape}

\item{n}{number of boundary points to generate}
}
\value{
the function returns tibble with the calculated values in column "value",
this function returns also some important information such as level, class, patch id and metric name.
}
\description{
Calculate Roughness index (RI)
}
\details{
to be added...
}
\examples{
vm_p_rough(vector_patches, "class", "patch", n = 100)
}
\references{
Basaraner, M., & Cetinkaya, S. (2017). Performance of shape indices and classification schemes for characterising perceptual shape complexity of building footprints in GIS.
International Journal of Geographical Information Science, 31(10), 1952–1977. https://doi.org/10.1080/13658816.2017.1346257
}
