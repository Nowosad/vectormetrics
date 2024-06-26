% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_l_mesh.R
\name{vm_l_mesh}
\alias{vm_l_mesh}
\title{Effective Mesh Size (vector data)}
\usage{
vm_l_mesh(landscape)
}
\arguments{
\item{landscape}{the input landscape image}
}
\value{
the returned calculated values are in column "value",
and this function returns also some important information such as level and metric name,
Moreover, class number and the "id" column, although both are "NA" here in the landscape level
}
\description{
This function helps to analyse the patch structure
the calculate process is, each patch is squared before the sums of them are calculated
and the sum is standardized by the total landscape area. it is a aggregation metric.
}
\examples{
vm_l_mesh(vector_landscape)
}
