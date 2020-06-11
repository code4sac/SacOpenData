install_packages = function(heroku_build = FALSE) {
  # CRAN Packages
  installed_packages = installed.packages()
  cran_packages = c("dplyr", 
                    "httr",
                    "jsonlite", 
                    "leaflet", 
                    "leaflet.extras", 
                    "R.utils", 
                    "reactable",   
                    "rintrojs", 
                    "sf", 
                    "shiny", 
                    "shinydashboard", 
                    "shinyjs", 
                    "shinyWidgets", 
                    "stringr",       
                    "tippy")
  for (package in cran_packages) {
    if (!(package %in% installed_packages[, 1])) {
      install.packages(package)
    }
  }
  
  # Local Package Files
  path = ifelse(heroku_build, "/app/", "")
  install.packages(paste0("esri2sf_0.1.1.tar.gz"), repos = NULL, type = "source")
}