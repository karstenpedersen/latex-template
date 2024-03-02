NAME = report
VIEWER := zathura
SRC_DIR := src
BUILD_DIR := build
FLAGS := --keep-intermediates

PDF := $(NAME).pdf
DEST_DIR := $(BUILD_DIR)/$(NAME)

.PHONY: all copy_directories build watch view clean

all: build

copy_directories:
	@echo "Creating build folder"
	$(eval DIRS := $(shell find $(SRC_DIR) -type d))
	@for dir in $(DIRS); do \
		mkdir -p $$(echo $$dir | sed 's|$(SRC_DIR)|$(DEST_DIR)|'); \
	done

build:
	$(MAKE) copy_directories
	tectonic -X build $(FLAGS)

watch:
	$(MAKE) copy_directories
	$(MAKE) view
	tectonic -X watch --exec "build $(FLAGS)"

view:
	$(VIEWER) $(PDF) &

clean:
	rm -r $(BUILD_DIR)
