#' @title The mean value of the Euclidean Nearest-Neighbor Distance of patches in each class(vector data)
#' 
#' @description This function allows you to calculate the mean value
#' of Euclidean Nearest-Neighbor Distance among patches of one class in a categorical landscape in vector data format
#' Euclidean Nearest-Neighbor Distance means the distance from a patch edge to the nearest neighbouring patch belonging to the
#' same class.
#' @param landscape the input landscape image,
#' @param class the name of the class column of the input landscape
#' @return  the returned calculated mean value of each class is in column "value",
#' and this function returns also some important information such as level, class number and metric name.
#' Moreover, the "id" column, although it is just NA here at class level. we need it because the output struture of metrics
#' at class level should correspond to patch level one by one, and then it is more convinient to combine metric values at different levels and compare them.
#' @examples
#' vm_c_enn_mn(vector_landscape, "class")
#' @export

vm_c_enn_mn <- function(landscape, class){
  enn <- vm_p_enn(landscape, class)
  enn_mn <- stats::aggregate(enn$value, by = list(enn$class), mean, na.rm = FALSE)

  # return results tibble
  tibble::new_tibble(list(
    level = rep("class", nrow(enn_mn)),
    class = as.integer(enn_mn[, 1]),
    id = as.integer(NA),
    metric = rep("enn_mn", nrow(enn_mn)),
    value = as.double(enn_mn[, 2])
  ))
}