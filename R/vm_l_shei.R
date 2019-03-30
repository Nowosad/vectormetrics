#' @title Shannons's evenness index (vector data)
#'
#' @description This function allows you to calculate the Shannons's evenness index
#' in a categorical landscape in vector data format, Shannons's evenness index is diversity index
#' It is the ratio between the actual Shannon's diversity index and and the theoretical maximum of the Shannon diversity index
#' @param landscape the input landscape image,
#' @param class the name of the class column of the input landscape

#' @return  the returned calculated index is in column "value",
#' and this function returns also some important information such as level and metric name,
#' Moreover, class number and the "id" column, although both are "NA" here in the landscape level
#' @examples
#' ## if the class name of input landscape is landcover,
#' ## then write landcover in a double quotation marks as the second parameter.
#' vm_l_shei(landscape, "landcover")

#' @export
vm_l_shei <- function(landscape, class){
  area_class <- vm_c_ca(landscape, class)
  area_class$value <- area_class$value * 10000
  A <- sum(area_class$value)

  area_class["pro"] <- area_class$value / A
  class_num <- length(area_class$class)
  shei <- -sum(area_class$pro * log(area_class$pro)) / log(class_num)
  # return results tibble
  tibble::tibble(
    level = "landscape",
    class = as.integer(NA),
    id = as.integer(NA),
    metric = "shei",
    value = as.double(shei)
  )
}