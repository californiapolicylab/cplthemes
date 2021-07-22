#' CPL [ggplot2] theme
#'
#' Adds major hoizontal panel gridlines to plots
#'
#' @param flip Is [coord_flip()] used? [logical]: TRUE/FALSE
#'
#' @md
#' @export
add_grid <- function(flip = FALSE) {

    if (flip == FALSE) {

        ggplot2::theme(panel.grid.major.y = ggplot2::element_line(colour = "#b2bbcb"))

    } else if (flip == TRUE) {

        ggplot2::theme(panel.grid.major.x = ggplot2::element_line(colour = "#b2bbcb"))

    } else {

        stop('Invalid "flip" argument. Valid arguments are: TRUE/FALSE',
             call. = FALSE)
    }
}
