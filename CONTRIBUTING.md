# Contributing

Thank you for your interest in contributing! All those looking to contribute are welcomed and encouraged, regardless of experience or skill level - asking questions and making mistakes are both perfectly acceptable here. 

The following guidelines have been created to make the contributing process as smooth as possible. If this is your first time contributing to an open source project, consider reading the [Open Source Guide to Contributing](https://opensource.guide/how-to-contribute/).

### What to Contribute
Feel free to contribute anything that improves the project - new features, bug fixes, improved documentation, etc. There are likely open [issues](https://github.com/mvanbommel/SacOpenData/issues) that can be addressed, or, if you have an idea that is not already an issue, feel free to create a new issue.

### How to Contribute
- Ensure there is an [issue](https://github.com/mvanbommel/SacOpenData/issues) referencing your intended change (if it does not already exist, create a new issue and include a detailed description of the change)
- [Fork](https://help.github.com/en/enterprise/2.13/user/articles/fork-a-repo#:~:text=A%20fork%20is%20a%20copy,point%20for%20your%20own%20idea.) the repository
- Within your forked repository, [create a branch](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-and-deleting-branches-within-your-repository) off of the master branch with a name describing the change
- Make, commit, and push your changes to your new branch
- Create a [pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request) to the original repository, referencing the issue you addressed in its description

That's it! Your pull request will then be reviewed.

#### Aside: Running the App
To run the app, you will need to [install R](https://cran.r-project.org/) ([installing RStudio](https://rstudio.com/products/rstudio/) is also recommended). When you run the app for the first time, run the commands:
```
source("install_package.R")
install_packages()
```
to ensure all necessary packages are loaded. 

You can then run the app using the 
```
shiny::runApp()
```
command. If you are unfamiliar with Shiny, there are [tutorials](https://shiny.rstudio.com/tutorial/) available.
