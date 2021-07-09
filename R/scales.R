scale_color_discrete <- function(...) {
    ggplot2::discrete_scale("colour", "cpl", urbn_color_pal("categorical"), ...)
}

scale_colour_discrete <- function(...) {
    ggplot2::discrete_scale("colour", "cpl", urbn_color_pal("categorical"), ...)
}

scale_fill_discrete <- function(...) {
    ggplot2::discrete_scale("fill", "cpl", urbn_color_pal("categorical"), ...)
}
