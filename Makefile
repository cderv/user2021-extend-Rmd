.PHONY: render-slides examples deploy init

all: render-slides examples

# render presentation
render-slides: slides/index.html

slides/index.html: slides/slides.Rmd
		Rscript -e 'xfun::in_dir("slides", rmarkdown::render("$(<F)", output_file = "$(@F)", quiet = TRUE))'

# Render demo file
demo = slides/simple-report.html slides/simple-report-enhanced.html

examples: $(demo)

$(demo): %.html: %.Rmd
		Rscript -e 'library(rmarkdown);render("$<", quiet = TRUE)'

# deployement
## this require the netlify cli to be setup
deploy:
		cd slides && \
		netlify deploy --dir=. --prod || echo '## >> netlify not configured - deployement skipped'

init:
		RScript -e 'renv::restore()'
		cd slides && RScript -e 'xaringan::summon_remark()'
