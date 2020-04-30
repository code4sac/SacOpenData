# Ensure all required package are installed
# Run source("packages.R"), or step through script line by line

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
    # Check for correct version of esri2sf
    if (!((package %in% installed_packages[, 1]) && 
          (grep(pattern = "van Bommel", x = maintainer("esri2sf"))))) {
      devtools::install_github(repo = "mvanbommel/esri2sf")
    }
  } else {
    if (!(package %in% installed_packages[, 1])) {
      install.packages(package)
    }
  }
}