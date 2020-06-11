# Script for the heroku build process to install necessary packages

source("/app/install_packages.R")

install_packages(heroku_build = TRUE)
