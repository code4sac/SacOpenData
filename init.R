# Ensure all required package are installed
# Run source("init.R"), or step through script line by line

installed_packages = installed.packages()

required_packages = c("devtools",
                      "dplyr", 
                      "esri2sf", 
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

for (package in required_packages) {
  if (package == "esri2sf") {
    install.packages("esri2sf_0.1.1.tar.gz", repos = NULL, type = "source")
  } else {
    if (!(package %in% installed_packages[, 1])) {
      install.packages(package)
    }
  }
}