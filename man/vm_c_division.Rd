% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_c_division.R
\name{vm_c_division}
\alias{vm_c_division}
\title{Landscape division index of each class(vector data)}
\usage{
vm_c_division(landscape, class_col)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class_col}{the name of the class column of the input landscape}
}
\value{
the returned calculated index is in column "value",
and this function returns also some important information such as level, class number and metric name.
Moreover, the "id" column, although it is just NA here at class level. we need it because the output struture of metrics
at class level should correspond to patch level one by one, and then it is more convinient to combine metric values at different levels and compare them.
}
\description{
This function allows you to calculate the Landscape division index
of each class in a categorical landscape in vector data format, Landscape division index can somehow reflect
the probability that two randomly selected points are not located in the same patch of class i
}
\examples{
vm_c_division(vector_landscape, "class")
}
