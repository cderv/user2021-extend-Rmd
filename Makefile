.PHONY: render-slides examples deploy init

all: render-slides examples

# render presentation
render-slides: slides/index.html slides/useR2021-extend-rmd.html

slides/index.html: slides/slides.Rmd
		Rscript -e 'xfun::in_dir("slides", rmarkdown::render("$(<F)", output_file = "$(@F)", quiet = TRUE))'

# self contained version
slides/useR2021-extend-rmd.html: slides/slides.Rmd
		Rscript -e 'xfun::in_dir("slides", rmarkdown::render("$(<F)", output_file = "$(@F)", quiet = TRUE))'

# Render demo file
demo-out := slides/simple-report.html slides/simple-report-enhanced.html
demo-source := $(subst .html,.Rmd, $(demo-out))

examples: $(demo-out)

$(demo-out): %.html: %.Rmd
		Rscript -e 'xfun::in_dir("slides", rmarkdown::render("$(<F)", output_file = "$(@F)", quiet = TRUE))'

$(demo-source): slides/%.Rmd: %.Rmd
		cp $< $@

# deployement
## this require the netlify cli to be setup
deploy:
		cd slides && \
		netlify deploy --dir=. --prod || echo '## >> netlify not configured - deployement skipped'

init:
		RScript -e 'renv::restore()'
		cd slides && RScript -e 'xaringan::summon_remark()'
