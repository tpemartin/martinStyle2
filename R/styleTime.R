#' Style yearly x-axis in the Economist style
#' @description major ticks in every five years. data range is ticked.
#'
#' @param gg a ggplot object
#'
#' @return a style instance
#' @export
#'
#' @examples
#' \dontrun{
#' gg |> StyleTime() -> style
#' gg + style$scale_x_continuous()
#' }
StyleTime = function(gg){

  # data dependent computation
  breaks = styleTime_createBreaks(gg)

    style=list()

  style$scale_x_continuous = function(...){
    scale_x_continuous(breaks=breaks,...)
  }

  style$example = function(){
    df = data.frame(
      year=1979:2018,
      y=1
    )
    gBefore <- ggplot(data=df) + geom_blank(aes(x=year, y=y))+labs(title="Before")
    library(patchwork)
    breaks = styleTime_createBreaks(gBefore)
    gAfter = gBefore + scale_x_continuous(breaks=breaks)+labs(title="After",
                                                              subtitle="Major ticks in every five years. Data range has ticks as well.")
    gBefore+gAfter
  }

  style$return$breaks=breaks

  return(style)
}
styleTime_createBreaks = function(gg){
  gg |> ggplot_build() -> .g2
  .g2$data[[1]]$x |> range() -> xrange
  xSeq = xrange[[1]]:xrange[[2]]
  xSeq |> subset(xSeq %% 5 ==0) -> xSeqMod5
  breaks <- c(xrange, xSeqMod5) |> sort()
  return(breaks)
}
