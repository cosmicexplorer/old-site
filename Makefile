.PHONY: all clean

THIS_MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

CREATOR_DIR := org-site-creator

SUBMODULES := $(CREATOR_DIR)
SUBMODULE_PROOFS := $(CREATOR_DIR)/Makefile

all: $(SUBMODULE_PROOFS)
	$(MAKE) -C $(CREATOR_DIR) rebuild

rebuild:
	@git submodule deinit -f .
	@git submodule update --init --recursive
	@cp site.config $(CREATOR_DIR)
	$(MAKE) all

$(SUBMODULE_PROOFS):
	@git submodule update --init --recursive

clean: $(SUBMODULE_PROOFS)
	$(MAKE) -C $(CREATOR_DIR) clean
