#' Colors
#'
#' @return a list of named lists of colors
#' @export
#'
#' @examples
#' cl=Colors()
#' cl$vanGoghStarNight
Colors = function(){
  colors = list()
  colors$vanGoghStarNight = list(
    stars = c("#9e5f00",'#c28800',"#ffdd1a","#ffea4d","#f8f481"),
    night = c("#1b1f7f","#23329c","#3048e8","#5b7ef1",'#84a7f7')
  )
  colors$show$vanGoghStarNight = function(){
    colors$vanGoghStarNight |>
      unlist() |>
      scales::show_col(ncol=5)
  }

  return(colors)
}
