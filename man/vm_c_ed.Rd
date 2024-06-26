% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_c_ed.R
\name{vm_c_ed}
\alias{vm_c_ed}
\title{The Edge density of each class(vector data)}
\usage{
vm_c_ed(landscape, class_col)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class_col}{the name of the class column of the input landscape}
}
\value{
the returned calculated total length of perimeter is in column "value",
and this function returns also some important information such as level, class number and metric name.
Moreover, the "id" column, although it is just NA here at class level. we need it because the output struture of metrics
at class level should correspond to patch level one by one, and then it is more convinient to combine metric values at different levels and compare them.
}
\description{
This function allows you to calculate the total length of all patches
in class i in a categorical landscape in vector data format
}
\examples{
vm_c_ed(vector_landscape, "class")
}
