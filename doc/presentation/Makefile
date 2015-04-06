all : presentation.pdf

presentation.pdf : presentation.tex
	pdflatex presentation
	pdflatex presentation

clean : 
	rm -f *.aux *.lof *.log *.lot *.fls *.out *.toc *.nav *.snm *~ presentation.pdf 
