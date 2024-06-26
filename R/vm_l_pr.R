#' @title Patch richness (vector data)
#'
#' @description This function allows you to calculate the Patch richness
#' in a categorical landscape in vector data format, Patch richness index is a simplest diversity index
#' @param landscape the input landscape image,
#' @param class_col the name of the class column of the input landscape
#' @return  the returned calculated index is in column "value",
#' and this function returns also some important information such as level and metric name,
#' Moreover, class number and the "id" column, although both are "NA" here in the landscape level
#' @examples
#' vm_l_pr(vector_landscape, "class")
#' @export

vm_l_pr <- function(landscape, class_col){
  pr <- length(unique(landscape[, class_col, drop = TRUE]))

  # return results tibble
  tibble::new_tibble(list(
    level = "landscape",
    class = as.character(NA),
    id = as.character(NA),
    metric = "pr",
    value = as.double(pr)
  ))
}
