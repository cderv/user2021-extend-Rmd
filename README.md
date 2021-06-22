
# useR!2021 - Talk - Extend Rmd

<!-- badges: start -->
<!-- badges: end -->

This is the repository with the resources (slides and demo) for the talk at useR!2021 about "Extend the functionality of your R Markdown document"

* Presentation: https://user2021-enhanced-rmd.netlify.app/

## What is available in this repo ?

### Important files!

* `simple-report.Rmd` is the base demo file that is used during the talk to build on to produce...
* `simple-report-enhanced.Rmd` which is the final report that includes all the recipes mentioned during the talk. 
* `slides/` is the folder containing the **xaringan** presentation source and related resources. Looking at the Rmd source can be interesting to see advanced usage of R Markdown.

### Other files.

* `renv/`: infrastructure for **renv** package managament
* `.Rprofile`: used for activating **renv** when entering the project
* `Makefile`: used as workflow tool to render the different contents. (if you don't know makefile, just use R code directly)


## Getting started...

### ...the easy way !

This project can be played with in the RStudio Cloud project: https://rstudio.cloud/project/2646304

Everything will configured an ready to go !

All the output files will also be already available to look at. This is why there will be a bit more than the one listed above and contained in the git repo.

You can update the project by running `git pull` in RStudio IDE's terminal.

## ...the hard way !

To run this project locally here are the steps

* Clone or fork this repository

* This project uses **renv** - this means that when you open the RStudio project it should install **renv** and ask you to restore all the environment
  ```r
  renv::restore()
  ```
* If you want to run the slides, don't forget to download remark
  ```r
  xfun::in_dir("slides/", xaringan::summon_remark())
  ```
* Everything should now be setup and you can render the different documents.

## Rendering the different documents

This project uses a _Makefile_ to render the document.

* Render the presentation
  ```sh
  make render-slides
  ```
  Once built, `servr::httd("slides")` can be used to serve the presentation locally

* Render the examples
  ```sh
  make examples
  ```
* Render everything at once
  ```sh
  make all
  ```

> I don't know about Makefile - Can I just use R and RStudio ?

Yes you can ! Just use the knit button in RStudio. The output filename could be different, but this repo is just about demo and toying with examples, so it does not matter much.
Otherwise, you can just use the `rmarkdown::render()`.
