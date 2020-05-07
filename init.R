# Ensure all required package are installed
# Run source("init.R"), or step through script line by line

installed_packages = installed.packages()

# List esri2sf last so that its dependencies are installed prior to installation
required_packages = c("dplyr", 
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
                      "tippy",
                      "esri2sf")

for (package in required_packages) {
  if (package == "esri2sf") {
    install.packages("/app/esri2sf_0.1.1.tar.gz", repos = NULL, type = "source")
  } else {
    if (!(package %in% installed_packages[, 1])) {
      install.packages(package)
    }
  }
}