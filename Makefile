.PHONY: all rebuild clean distclean sweep html_only js_only

CREATOR_DIR := org-site-creator

SUBMODULES := $(CREATOR_DIR)
SUBMODULE_PROOFS := $(CREATOR_DIR)/Makefile

all: $(SUBMODULE_PROOFS)
	cp site.config $(CREATOR_DIR)
	$(MAKE) -C $(CREATOR_DIR) rebuild
	$(MAKE) sweep

html_only:
	$(MAKE) -C $(CREATOR_DIR) html_only

js_only:
	$(MAKE) -C $(CREATOR_DIR) js_only

rebuild: all | clean

$(SUBMODULE_PROOFS):
	git submodule update --init --recursive
	git submodule foreach git pull origin master

clean:
	$(MAKE) -C $(CREATOR_DIR) clean

distclean: clean
	git submodule deinit -f .

sweep:
	$(MAKE) -C $(CREATOR_DIR) sweep
