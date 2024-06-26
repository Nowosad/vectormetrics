#' @title Perimeter-Area Fractal Dimension(vector data)
#' 
#' @description This function allows you to get the result of 2 divided by ß,
#' ß is the slope of the regression of the area against the perimeter in logarithm of all patches in a categorical landscape in vector data format
#' @param landscape the input landscape image,
#' @return  the returned calculated slope is in column "value",
#' and this function returns also some important information such as level and metric name,
#' Moreover, class number and the "id" column, although both are "NA" here in the landscape level
#' @examples
#' vm_l_pafrac(vector_landscape)
#' @export

vm_l_pafrac <- function(landscape){
  area <- vm_p_area(landscape)
  perim <- vm_p_perim(landscape)
  area$value <- log(area$value * 10000)
  perim$value <- log(perim$value)
  area <- as.data.frame(area)
  perim <- as.data.frame(perim)
  data <- merge(area[, c("class", "value", "id")], perim[, c("class", "value", "id")], by = "id")
  names(data) <- c("id", "class_area", "area", "class_perim", "perim")

  model <- stats::lm(data$area ~ data$perim)
  summ <- summary(model)
  if (summ$r.squared > 0.8){
    index <- model$coefficients[2]
  } else { 
    index <- NA
  }
  pafrac <- 2 / index

  # return results tibble
  tibble::new_tibble(list(
    level = "landscape",
    class = as.character(NA),
    id = as.character(NA),
    metric = "pafrac",
    value = as.double(pafrac)
  ))
}
