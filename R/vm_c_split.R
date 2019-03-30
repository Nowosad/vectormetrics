#' @title Splitting index (vector data)

#' @description This function allows you to calculate the relation between square of landscape area
#' and sum of square of all patch area of class i in a categorical landscape in vector data format
#' it is a aggregation metric.
#' @param landscape the input landscape image,
#' @param class the name of the class column of the input landscape
#' @return  the returned calculated indices are in column "value",
#' and this function returns also some important information such as level, class number and metric name.
#' Moreover, the "id" column, although it is just NA here at class level. we need it because the output struture of metrics
#' at class level should correspond to patch level one by one, and then it is more convinient to combine metric values at different levels and compare them.
#' @examples
#' ## if the class name of input landscape is landcover,
#' ## then write landcover in a double quotation marks as the second parameter.
#' vm_c_split(landscape, "landcover")

#' @export
vm_c_split <- function(landscape, class){
  # the total landscape area in square meters
  area <- vm_p_area(landscape, class)
  area$value <- area$value * 10000
  A <- sum(area$value)
  # the sum of all the area squares of patches belonging to each class
  area$square <- area$value ^2
  area_c <- aggregate(area$square, by= list(area$class), sum)
  names(area_c) <- c("class", "area_square")

  area_c$split <- A^2/area_c$area_square
  # return results tibble
  tibble::tibble(
    level = "class",
    class = as.integer(area_c$class),
    id = as.integer(NA),
    metric = "split",
    value = as.double(area_c$split)
  )
}