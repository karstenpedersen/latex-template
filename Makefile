NAME = report
VIEWER := xdg-open
SRC_DIR := src
BUILD_DIR := build
FLAGS := --keep-intermediates

DEST_DIR := $(BUILD_DIR)/$(NAME)
PDF := $(DEST_DIR)/$(NAME).pdf

.PHONY: all init build watch view clean

all: build

init:
	@echo "creating $(BUILD_DIR) folder"
	$(eval DIRS := $(shell find $(SRC_DIR) -type d))
	@for dir in $(DIRS); do \
		mkdir -p $$(echo $$dir | sed 's|$(SRC_DIR)|$(DEST_DIR)|'); \
	done

build: init
	tectonic -X build $(FLAGS)

watch: init
	tectonic -X watch --exec "build $(FLAGS)"

view:
	$(VIEWER) $(PDF) &

clean:
	rm -r $(BUILD_DIR)
