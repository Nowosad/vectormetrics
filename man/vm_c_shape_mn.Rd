% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vm_c_shape_mn.R
\name{vm_c_shape_mn}
\alias{vm_c_shape_mn}
\title{The mean value of Shape index of each class (vector data)}
\usage{
vm_c_shape_mn(landscape, class_col)
}
\arguments{
\item{landscape}{the input landscape image,}

\item{class_col}{the name of the class column of the input landscape}
}
\value{
the returned calculated mean value of each class is in column "value",
and this function returns also some important information such as level, class number and metric name.
Moreover, the "id" column, although it is just NA here at class level. we need it because the output struture of metrics
at class level should correspond to patch level one by one, and then it is more convinient to combine metric values at different levels and compare them.
}
\description{
This function allows you to calculate the mean value
of shape index of all patches belonging to one class in a categorical landscape in vector data format
shape index is the ratio between the actual perimeter of the patch and the hypothetical minimum perimeter of the patch.
The minimum perimeter equals the perimeter if the patch would be maximally compact. That means,
the perimeter of a circle with the same area of the patch.
}
\examples{
vm_c_shape_mn(vector_landscape, "class")
}
