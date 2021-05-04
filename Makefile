# Diretório onde os arquivos temporários e o PDF serão
# gerados por latexmk.
#
# Mantenha sincronizado com o valor em .gitignore
OUT_DIR ?= latex.out

# Opções passadas para latexmk.
LATEXMK_FLAGS ?= -pdf -shell-escape

TEX_SRCS := $(shell find . -type f -name "*.tex")
BIB_SRCS := $(shell find . -type f -name "*.bib")
IMG_SRCS := $(shell find . -type f -name "*.jpg" -or -name "*.png" -or -name "*.eps")

SRCS := $(TEX_SRCS) $(BIB_SRCS) $(IMG_SRCS)

MAIN_TEX = tg.tex
TESE = $(OUT_DIR)/tg.pdf

pdf: $(TESE)

clean:
	@rm -rf $(OUT_DIR)

open: $(TESE)
	@zathura $<

$(TESE): $(SRCS)
	@rm -rf $(OUT_DIR)
	@latexmk $(LATEXMK_FLAGS) -output-directory=$(OUT_DIR) $(MAIN_TEX)

PHONY: open pdf clean
