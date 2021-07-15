#' Makes the custom CPL theme the default theme for ggplot
#'
#' @param base_size Base font size. Default is 12.
#' @param base_family Font. Default is Arial.
#' @param base_line_size Default is 0.5
#' @param base_rect_size Default is 0.5
#'
#' @return
#' @export
#'
#' @examples
setThemeCPL <- function(base_size = 12,
                     base_family = "Arial",
                     base_line_size = 0.5,
                     base_rect_size = 0.5) {

    ggplot2::theme_set(customCPLTheme())

    # add base_family font to text and label geoms ---------------------------

    ggplot2::update_geom_defaults("text", list(family = base_family))
    ggplot2::update_geom_defaults("label", list(family = base_family))

    # set default color scales for continuous variables -----------------------

    options(
        ggplot2.continuous.colour = "gradient",
        ggplot2.continuous.fill = "gradient"
    )

    # set default colors for monochromatic geoms ------------------------------

    ggplot2::update_geom_defaults("bar", list(fill = "#246195"))
    ggplot2::update_geom_defaults("col", list(fill = "#246195"))
    ggplot2::update_geom_defaults("point", list(colour = "#246195"))
    ggplot2::update_geom_defaults("line", list(colour = "#246195"))
    ggplot2::update_geom_defaults("step", list(colour = "#246195"))
    ggplot2::update_geom_defaults("path", list(colour = "#246195"))
    ggplot2::update_geom_defaults("boxplot", list(fill = "#246195"))
    ggplot2::update_geom_defaults("density", list(fill = "#246195"))
    ggplot2::update_geom_defaults("violin", list(fill = "#246195"))

    # set default colors for monochromatic stats ------------------------------

    ggplot2::update_stat_defaults("count", list(fill = "#246195"))
    ggplot2::update_stat_defaults("boxplot", list(fill = "#246195"))
    ggplot2::update_stat_defaults("density", list(fill = "#246195"))
    ggplot2::update_stat_defaults("ydensity", list(fill = "#246195"))

}
