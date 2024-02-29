#' @title Convexity(vector data)
#'
#' @description Calculate convexity
#' @details ratio between perimeter of convex hull and perimeter of polygon
#' @param landscape the input landscape image,
#' @param class the name of the class column of the input landscape
#' @return the function returns tibble with the calculated values in column "value",
#' this function returns also some important information such as level, class, patch id and metric name.
#' @examples
#' vm_p_convex(vector_landscape, "class")
#' @references
#' Jiao, L., Liu, Y., & Li, H. (2012). Characterizing land-use classes in remote sensing imagery by shape metrics.
#' ISPRS Journal of Photogrammetry and Remote Sensing, 72, 46–55. https://doi.org/10.1016/j.isprsjprs.2012.05.012
#' @export

vm_p_convex <- function(landscape, class) {
  # check whether the input is a MULTIPOLYGON or a POLYGON
  if (!all(sf::st_geometry_type(landscape) %in% c("MULTIPOLYGON", "POLYGON"))) {
    stop("Please provide POLYGON or MULTIPOLYGON")
  } else if (all(sf::st_geometry_type(landscape) == "MULTIPOLYGON")) {
    message("MULTIPOLYGON geometry provided. You may want to cast it to seperate polygons with 'get_patches()'.")
  }

  # select geometry column for spatial operations and the column that identifies the classes
  landscape[, class] <- as.factor(landscape[, class, drop = TRUE])
  landscape <- landscape[, class]

  # calculate the perimeter of polygons
  landscape$perim <- vm_p_perim(landscape, class)$value

  # calculate the perimeter of convex hull
  landscape$conv_perim <- vm_p_hull_p(landscape, class)$value

  # ratio of perimeter of convex hull and polygon perimeters
  conv_index <- landscape$conv_perim / landscape$perim

  # return results tibble
  class_ids <- sf::st_set_geometry(landscape, NULL)[, class, drop = TRUE]
  if (methods::is(class_ids, "factor")){
    class_ids <- as.numeric(as.factor(levels(class_ids)))[class_ids]
  }

  tibble::new_tibble(list(
    level = rep("patch", nrow(landscape)),
    class = as.integer(class_ids),
    id = as.integer(seq_len(nrow(landscape))),
    metric = rep("conv_index", nrow(landscape)),
    value = as.double(conv_index)
  ))
}