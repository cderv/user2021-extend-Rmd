all: render examples deploy

render:
		Rscript -e 'xfun::in_dir("slides", rmarkdown::render("slides.Rmd", output_file = "index.html"))'

examples:
		Rscript -e 'rmarkdown::render("simple-report.Rmd", quiet = TRUE)'
		Rscript -e 'rmarkdown::render("simple-report-enhanced.Rmd", quiet = TRUE)'
		cp simple-report.html slides/simple-report.html
		cp simple-report-enhanced.html slides/simple-report-enhanced.html

deploy:
		cd slides && \
		netlify deploy --dir=. --prod
