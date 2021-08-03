#' A function that wraps up several lines of code to check for required packages.
#' If the required packages are not installed, then it will install them. This
#' requires automatically identifying the R version number (major, minor) and
#' combining that with the repo URL to use the correct url.
#'
#' @md
#'
#' @return
#' @export
check_required_packages <- function() {

    REQUIRED_PACKAGES = c("tidyverse","cplthemes","tidylog")

    # Extract R version and construct repo URL
    R_VERSION = paste(R.Version()$major,
                      substr(x = R.Version()$minor, start = 0, stop = 1),
                      sep = '.')
    REPO_URL = paste("file:////commons/Commons/code/r/repo_",R_VERSION,sep = '')

    # Checking if required packages are installed and if not, installing them
    install_status = REQUIRED_PACKAGES %in% installed.packages()
    for (i in seq_along(install_status)) {
        if (install_status[i] == FALSE) {
            print(paste("Installing: ",REQUIRED_PACKAGES[i]))
            install.packages(REQUIRED_PACKAGES[i], repos = REPO_URL)
        }
    }
}
