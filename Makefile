TARGETS = $(patsubst src/%.md, docs/%.html, $(wildcard src/*))

all: $(TARGETS)

docs/%.html: src/%.md
	pandoc -s $< --no-highlight -c style.css --template template.html --toc --toc-depth=2 -o $@
