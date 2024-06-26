#' @title Disjunct core area density of the whole landscape(vector data)
#' 
#' @description This function allows you to calculate the number of disjunct core areas
#' in relation to the landscape area in a categorical landscape in vector data format
#' @param landscape the input landscape image,
#' @param edge_depth the fixed distance to the edge of the patch
#' @return  the returned calculated ratios are in column "value",
#' and this function returns also some important information such as level and metric name,
#' Moreover, class number and the "id" column, although both are "NA" here in the landscape level
#' @examples
#' vm_l_dcad(vector_landscape, edge_depth = 1)
#' @export

vm_l_dcad <- function(landscape, edge_depth){
  # the total landscape area
  area <- vm_p_area(landscape)
  area_sum <- sum(area$value * 10000)

  core_num <- vm_p_ncore(landscape, edge_depth = edge_depth)
  # grouped by the class, and then calculate the sum of number of disjunct core area in each class
  core_num_sum <- sum(core_num$value)
  DCAD <- (core_num_sum / area_sum) * 100

  # return results tibble
  tibble::new_tibble(list(
    level = "landscape",
    class = as.character(NA),
    id = as.character(NA),
    metric = "dcad",
    value = as.double(DCAD)
  ))
}
