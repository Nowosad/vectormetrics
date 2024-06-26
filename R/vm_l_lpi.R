#' @title Largest patch index(vector data)

#' @description This function allows you to calculate the maximal patch area in relative to
#' total landscape area in a categorical landscape in vector data format
#' @param landscape the input landscape image,
#' @return the function returns tibble with the calculated values in column "value",
#' this function returns also some important information such as level, class, patch id and metric name.
#' @examples
#' vm_l_lpi(vector_landscape)
#' @export

vm_l_lpi <- function(landscape){
  area <- vm_p_area(landscape)
  # landscape area
  sum_landscape <- sum(area$value) * 10000
  # maximal patch area of each class
  area_max <- max(area$value)
  lpi <- area_max * 10000 / sum_landscape * 100
  
  # return results tibble
  tibble::new_tibble(list(
    level = "landscape",
    class = as.character(NA),
    id = as.character(NA),
    metric = "lpi",
    value = as.double(lpi)
  ))
}
