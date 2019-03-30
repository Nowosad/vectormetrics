#' @title The standard deviation of the number of disjunct core areas of each class(vector data)
#' @description This function allows you to calculate the standard deviation
#' of all number of disjunct core areas belonging to one class in a categorical landscape in vector data format
#' @param landscape the input landscape image,
#' @param class the name of the class column of the input landscape
#' @param core_distance the fixed distance to the edge of the patch
#' @return  the returned calculated standard deviation of each class is in column "value",
#' and this function returns also some important information such as level, class number and metric name.
#' Moreover, the "id" column, although it is just NA here at class level. we need it because the output struture of metrics
#' at class level should correspond to patch level one by one, and then it is more convinient to combine metric values at different levels and compare them.
#' @examples
#' ## if the class name of input landscape is landcover,
#' ## then write landcover in a double quotation marks as the second parameter.
#' vm_c_dcore_sd(landscape, "landcover", core_distance= 1)

#' @export
vm_c_dcore_sd <- function(landscape, class, core_distance){
  dcore <- vm_p_ncore(landscape, class, core_distance)
  # grouped by the class, and then calculate the standard deviation of the number of disjunct core areas in each class.
  dcore_sd <- aggregate(dcore$value, by= list(dcore$class), sd)
  names(dcore_sd) <- c("class", "dcore_sd")

  # return results tibble
  tibble::tibble(
    level = "class",
    class = as.integer(dcore_sd$class),
    id = as.integer(NA),
    metric = "dcore_sd",
    value = as.double(dcore_sd$dcore_sd)
  )
}