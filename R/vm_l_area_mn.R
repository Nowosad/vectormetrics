#' @title The mean value of all patch areas at landscape level(vector data)
#' @description This function allows you to calculate the mean value
#' of all patch areas in a categorical landscape in vector data format

#' @param landscape the input landscape image,
#' @param class the name of the class column of the input landscape

#' @return  the returned calculated mean value of areas is in column "value",
#' and this function returns also some important information such as level and metric name,
#' Moreover, class number and the "id" column, although both are "NA" here in the landscape level
#' @examples
#' ## if the class name of input landscape is landcover,
#' ## then write landcover in a double quotation marks as the second parameter.
#' vm_l_area_mn(landscape, "landcover")

#' @export
vm_l_area_mn <- function(landscape, class){
  area <- vm_p_area(landscape, class)
  area_l <- mean(area$value * 10000)
  # return results tibble
  tibble::tibble(
    level = "landscape",
    class = as.integer(NA),
    id = as.integer(NA),
    metric = "area_mn",
    value = as.double(area_l)
  )
}