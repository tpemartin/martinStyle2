#' Style2 constructor with a style of no-axis y .....
#'
#' @return a style instance with an example
#' @export
#'
#' @examples
#' style = Style()
#' style$example()
Style2 <- function() {
  library(ggplot2)
  # a container
  style <- list()
  # theme
  style$theme <- function(...){ theme(...,
    axis.ticks = element_blank(),
    axis.line.y = element_blank(),
    axis.title.y = element_text(angle = 0),
    panel.grid.major.y = element_line(color = "grey")
  ) }
  # scale
  style$scale_y_continuous <- function(...){ scale_y_continuous(...,
    expand = c(0, 0)
  )}
  # example
  style$example = function(){
    library(patchwork)
    gBefore = ggplot(mpg, aes(class)) + geom_bar() + labs(title = "before")
    gAfter = gBefore + style$theme()+style$scale_y_continuous()+labs(title = "after")
    gBefore + gAfter
  }

  return(style)
}
