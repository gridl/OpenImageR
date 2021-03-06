
#' display an image
#' 
#' 
#' This function displays an image
#' 
#' @param file_path if file_path is a character string, then a shiny application is utilized. If file_path is a matrix, data.frame OR a 3-dimensional array then the grid.raster function of the base grid package is used.
#' @return displays an image
#' @details
#' This function displays an image using either a character path, a 2- or a 3-dimensional object.
#' @export
#' @examples
#' 
#' # path = system.file("tmp_images", "1.png", package = "OpenImageR")
#' 
#' # imageShow(path)
#' 


imageShow = function(file_path) {
  
  try_err_files = inherits(tryCatch(normalizePath(file_path, mustWork = T), error = function(e) e), "error")
  
  if (class(file_path) != "character" && length(dim(file_path)) == 2 && !is.matrix(file_path)) file_path = as.matrix(file_path)
  
  if ((class(file_path) == 'matrix' || class(file_path) == 'array')) {
    
    file_path = func_chech_range(file_path)
    
    grid::grid.raster(file_path)
  }
  
  else if (class(file_path) == "character" && try_err_files == F){
    
    file_path <<- normalizePath(file_path)
    
    runUI()
  }
  
  else {
    
    stop('invalid path or object')
  }
}
    
    


