#' @title the number of disjunct core area(vector data)
#'
#' @description This function allows you to calculate the number of disjunct core areas of all patches
#' Core area is defined as an area that within the patch and its edge is a fixed value from the boundary of the patch.
#' Disjunct core area is defined as a new discrete area(patch), which is a sub-part of core area
#' @param landscape the input landscape image,
#' @param class the name of the class column of the input landscape
#' @param core_distance the fixed distance to the edge of the patch
#' @return  the returned calculated core areasnumber of disjunct core areas of all patches are in column "value",
#' and this function returns also some important information such as level, class, patch id and metric name.
#' @examples
#' ## if the class name of input landscape is landcover,
#' ## then write landcover in a double quotation marks as the second parameter.
#' vm_p_core(landscape, "landcover", core_distance = 0.8)
#' @export

vm_p_ncore <- function(landscape, class, core_distance){
  # check whether the input is a MULTIPOLYGON or a POLYGON
  if(!all(sf::st_geometry_type(landscape) %in% c("MULTIPOLYGON", "POLYGON"))){
    stop("Please provide PLOYGON or MULTIPLOYGON")
  }

  # extract the multipolygon, cast to single polygons (patch level)

  if(any(sf::st_geometry_type(landscape) == "MULTIPOLYGON")){
    multi <- landscape[sf::st_geometry_type(landscape)=="MULTIPOLYGON", ]
    landscape_multi<- sf::st_cast(multi, "POLYGON", warn = FALSE)
    landscape_poly <- landscape[sf::st_geometry_type(landscape)=="POLYGON", ]
    landscape <- rbind(landscape_multi, landscape_poly)
  }

  #create the core areas using st_buffer with a negetive distance to the edge of polygons
  core_area <- sf::st_buffer(landscape, dist = -core_distance)

  # the number of polygons(Disjunct core areas) in each patch
  core_area$core_area_number <- sapply(core_area$geometry, length)

  class_ids <-dplyr::pull(sf::st_set_geometry(landscape, NULL), class)
  if (class(class_ids) == "factor"){
    class_ids <- as.numeric(levels(class_ids))[class_ids]
  }
  tibble::tibble(
    level = "patch",
    class = as.integer(class_ids),
    id = as.integer(1:nrow(core_area)),
    metric = "ncore",
    value = as.double(core_area$core_area_number)
  )
}