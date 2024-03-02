DEST_DIR := build/
PDF := build/report/report.pdf
FLAGS := --keep-intermediates
VIEWER := zathura

.PHONY: all build watch view clean

all: build

build:
	tectonic -X build $(FLAGS)

watch:
	$(MAKE) view
	tectonic -X watch --exec "build $(FLAGS)"

view:
	$(VIEWER) $(PDF) &

clean:
	rm -r $(DEST_DIR)
