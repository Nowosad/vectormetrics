#' @title The mean value of number of core areas in landscape(vector data)
#' 
#' @description This function allows you to calculate the mean value
#' of the total number of disjunct core areas in a categorical landscape in vector data format
#' @param landscape the input landscape image,
#' @param edge_depth the fixed distance to the edge of the patch
#' @return  the returned calculated mean value of number of the whole landscape is in column "value",
#' and this function returns also some important information such as level and metric name,
#' Moreover, class number and the "id" column, although both are "NA" here in the landscape level
#' @examples
#' vm_l_dcore_mn(vector_landscape, edge_depth= 1)
#' @export

vm_l_dcore_mn <- function(landscape, edge_depth){
  ncore <- vm_p_ncore(landscape, edge_depth = edge_depth)
  ncore_l <- mean(ncore$value)

  # return results tibble
  tibble::new_tibble(list(
    level = "landscape",
    class = as.character(NA),
    id = as.character(NA),
    metric = "dcore_mn",
    value = as.double(ncore_l)
  ))
}
