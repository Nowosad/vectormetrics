% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_l_ndca.R
\name{vm_l_ndca}
\alias{vm_l_ndca}
\title{the number of disjunct core area in the whole landscape(vector data)}
\usage{
vm_l_ndca(landscape, edge_depth)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{edge_depth}{the fixed distance to the edge of the patch}
}
\value{
the returned calculated number of core area is in column "value",
and this function returns also some important information such as level and metric name,
Moreover, class number and the "id" column, although both are "NA" here in the landscape level
}
\description{
This function allows you to calculate the number of disjunct core areas in a categorical landscape in vector data format
}
\examples{
vm_l_ndca(vector_landscape, edge_depth = 1)
}
