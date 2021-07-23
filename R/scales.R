#' CPL [ggplot2] theme
#'
#' Applying CPL's color palettes as [ggplot2] defaults
#'
#' @export
#' @param palette Palette name.
func_palette_cpl <- function(palette = "brief") {
    palette_list <- palette_cpl

    types <- palette_list[[palette]]

    function(n) {
        types[[n]]
    }
}

#' Discrete color scale that aligns with CPL style
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_color_discrete <- function(...) {
    ggplot2::discrete_scale("colour", "cpl", func_palette_cpl(COLOR_SCHEMA), ...)
}

#' Discrete color scale that aligns with CPL style
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_colour_discrete <- function(...) {
    ggplot2::discrete_scale("colour", "cpl", func_palette_cpl(COLOR_SCHEMA), ...)
}

#' Discrete color scale that aligns with CPL style
#'
#' @md
#' @param ... other arguments passed to \code{discrete_scale()}
#' @export
scale_fill_discrete <- function(...) {
    ggplot2::discrete_scale("fill", "cpl", func_palette_cpl(COLOR_SCHEMA), ...)
}
