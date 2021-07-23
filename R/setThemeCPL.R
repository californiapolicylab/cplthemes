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
setThemeCPL <- function(color_schema = 'brief',
                        base_size = 12,
                        base_family = "Arial",
                        base_line_size = 0.5,
                        base_rect_size = 0.5) {

    COLOR_SCHEMA <<- color_schema

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

    if (color_schema == 'brief') {
        first_element = "#2691d1"
    } else if (color_schema == 'ucla') {
        first_element = '#015587'
    } else if (color_schema == 'ucb') {
        first_element = '#2D637F'
    } else {
        print("'color_schema' can take three values: 'brief', 'ucla', or 'ucb'")
    }

    ggplot2::update_geom_defaults("bar", list(fill = first_element))
    ggplot2::update_geom_defaults("col", list(fill = first_element))
    ggplot2::update_geom_defaults("point", list(colour = first_element))
    ggplot2::update_geom_defaults("line", list(colour = first_element))
    ggplot2::update_geom_defaults("step", list(colour = first_element))
    ggplot2::update_geom_defaults("path", list(colour = first_element))
    ggplot2::update_geom_defaults("boxplot", list(fill = first_element))
    ggplot2::update_geom_defaults("density", list(fill = first_element))
    ggplot2::update_geom_defaults("violin", list(fill = first_element))

    # set default colors for monochromatic stats ------------------------------

    ggplot2::update_stat_defaults("count", list(fill = first_element))
    ggplot2::update_stat_defaults("boxplot", list(fill = first_element))
    ggplot2::update_stat_defaults("density", list(fill = first_element))
    ggplot2::update_stat_defaults("ydensity", list(fill = first_element))

}
