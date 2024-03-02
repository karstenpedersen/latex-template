DEST_DIR := build/

.PHONY all clean

all:
	tectonic -X build -k

clean:
	rm -r $(DEST_DIR)
