#' CPL [ggplot2] theme
#'
#' Save a ggplot with CPL defaults
#'
#' @param filename The filename for your plot. [str]
#'
#' @md
#' @export

cpl_save <- function(filename, ...) {

    filename = paste(filename, "pdf", sep = ".")

    ggplot2::ggsave(filename = filename, dpi = "print", units = "in",
                    height = (7L/2L), width = 5L, ...)
}
