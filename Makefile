# Minimal helpers (optional)
.PHONY: report slides

report:
	jupyter nbconvert notebooks/02_presentation_report.ipynb --to html --output-dir docs

slides:
	jupyter nbconvert notebooks/02_presentation_report.ipynb --to slides --reveal-prefix https://revealjs.com --output-dir docs
