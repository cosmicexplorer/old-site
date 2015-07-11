.PHONY: all rebuild clean distclean sweep html_only

THIS_MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

CREATOR_DIR := org-site-creator

SUBMODULES := $(CREATOR_DIR)
SUBMODULE_PROOFS := $(CREATOR_DIR)/Makefile

all: $(SUBMODULE_PROOFS)
	$(MAKE) -C $(CREATOR_DIR) rebuild
	$(MAKE) sweep

html_only:
	$(MAKE) -C $(CREATOR_DIR) html_only

rebuild:
	@cp site.config $(CREATOR_DIR)
	$(MAKE) -C $(CREATOR_DIR) clean
	$(MAKE) all

$(SUBMODULE_PROOFS):
	@git submodule update --init --recursive

clean: $(SUBMODULE_PROOFS)
	$(MAKE) -C $(CREATOR_DIR) clean

distclean: clean
	@git submodule deinit -f .

sweep:
	$(MAKE) -C $(CREATOR_DIR) sweep
