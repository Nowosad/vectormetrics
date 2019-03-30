#' @title The perimeter of each patches(vector data)
#'
#' @description This function allows you to calculate the perimeter of each patches in a categorical landscape in vector data format
#' @param landscape the input landscape image,
#' @param class the name of the class column of the input landscape
#' @return  the returned calculated perimeter of all patches is in column "value",
#' and this function returns also some important information such as level, class, patch id and metric name.
#' ## if the class name of input landscape is landcover,
#' ## then write landcover in a double quotation marks as the second parameter.
#' st_p_area(landscape, "landcover")
#' @export

vm_p_perim <- function(landscape, class) {

  # check whether the input is a MULTIPOLYGON or a POLYGON
  if(!all(sf::st_geometry_type(landscape) %in% c("MULTIPOLYGON", "POLYGON"))){
    stop("Please provide PLOYGON or MULTIPLOYGON")
  }

  # select geometry column for spatial operations and the column that identifies
  # the classes
  landscape <- dplyr::select(landscape, class, "geometry")

  # extract the multipolygon, cast to single polygons (patch level)

  if(any(sf::st_geometry_type(landscape) == "MULTIPOLYGON")){
    multi <- landscape[sf::st_geometry_type(landscape)=="MULTIPOLYGON", ]
    landscape_multi<- sf::st_cast(multi, "POLYGON", warn = FALSE)
    landscape_poly <- landscape[sf::st_geometry_type(landscape)=="POLYGON", ]
    landscape <- rbind(landscape_multi, landscape_poly)
  }

  # cast then to multilinestring
  landscape_cast_2 <- sf::st_cast(landscape, "MULTILINESTRING", warn = FALSE)

  # calculate the length of each multilinestring, that is the perimeter of each polygon as well
  landscape_cast_2$perim <- sf::st_length(landscape_cast_2)

  # return results tibble
  class_ids <- dplyr::pull(sf::st_set_geometry(landscape, NULL), class)
  if (class(class_ids) == "factor"){
    class_ids <- as.numeric(levels(class_ids))[class_ids]
  }
  tibble::tibble(
    level = "patch",
    class = as.integer(class_ids),
    id = as.integer(1:nrow(landscape_cast_2)),
    metric = "perim",
    value = as.double(landscape_cast_2$perim)
  )
}