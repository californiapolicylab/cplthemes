#' CPL [ggplot2] theme
#'
#' Adds major hoizontal panel gridlines
#'
#' @param flip TRUE/FALSE is `coord_flip()` used
#'
#' @md
#' @export
add_grid <- function(flip = FALSE) {

    if (flip == FALSE) {

        ggplot2::theme(panel.grid.major.y = ggplot2::element_line(colour = "#b2bbcb"))

    } else if (flip == TRUE) {

        ggplot2::theme(panel.grid.major.x = ggplot2::element_line(colour = "#b2bbcb"))

    } else {

        stop('Invalid "axis" or "flip" argument. Valid arguments are: TRUE/FALSE',
             call. = FALSE)
    }
}
