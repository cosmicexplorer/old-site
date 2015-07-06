.PHONY: clean

THIS_MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

SITE := $(shell find $(CURRENT_DIR) -not -name "." -not -name ".." \
	-not -name ".git" -exec readlink -f '{}' ';')
SITE_MINUS_THIS := $(patsubst $(THIS_MAKEFILE_PATH),,$(SITE))

clean:
	@rm -rf $(SITE_MINUS_THIS)
