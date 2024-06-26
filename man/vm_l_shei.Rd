% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_l_shei.R
\name{vm_l_shei}
\alias{vm_l_shei}
\title{Shannons's evenness index (vector data)}
\usage{
vm_l_shei(landscape, class_col)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class_col}{the name of the class column of the input landscape}
}
\value{
the returned calculated index is in column "value",
and this function returns also some important information such as level and metric name,
Moreover, class number and the "id" column, although both are "NA" here in the landscape level
}
\description{
This function allows you to calculate the Shannons's evenness index
in a categorical landscape in vector data format, Shannons's evenness index is diversity index
It is the ratio between the actual Shannon's diversity index and and the theoretical maximum of the Shannon diversity index
}
\examples{
vm_l_shei(vector_landscape, "class")
}
