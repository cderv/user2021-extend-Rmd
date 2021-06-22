all: render-slides examples

render-slides:
		Rscript -e 'xfun::in_dir("slides", rmarkdown::render("slides.Rmd", output_file = "index.html"))'

examples:
		Rscript -e 'rmarkdown::render("simple-report.Rmd", quiet = TRUE)'
		Rscript -e 'rmarkdown::render("simple-report-enhanced.Rmd", quiet = TRUE)'
		cp simple-report.html slides/simple-report.html
		cp simple-report-enhanced.html slides/simple-report-enhanced.html
		cp simple-report.Rmd slides/simple-report.Rmd
		cp simple-report-enhanced.Rmd slides/simple-report-enhanced.Rmd

# this require the netlify cli to be setup
deploy:
		cd slides && \
		netlify deploy --dir=. --prod || echo '## >> netlify not configured - deployement skipped'
