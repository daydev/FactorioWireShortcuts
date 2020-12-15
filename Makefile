VERSION := $(shell node -p "require('./info.json').version")
NAME := $(shell node -p "require('./info.json').name")
FACTORIO_HOME := $$HOME/bin/games/factorio

all: clean build install_mod

build:
	mkdir build/
	mkdir build/$(NAME)_$(VERSION)
	cp -R info.json thumbnail.png data.lua data-final-fixes.lua control.lua settings.lua changelog.txt graphics locale migrations prototypes build/$(NAME)_$(VERSION)
	cd build && zip -r $(NAME)_$(VERSION).zip $(NAME)_$(VERSION)

clean:
	rm -rf build/

install_mod:
	if [ -d $(FACTORIO_HOME) ] ; \
	then \
		rm -rf $(FACTORIO_HOME)/mods/$(NAME)_* ; \
		cp build/$(NAME)_$(VERSION).zip $(FACTORIO_HOME)/mods ; \
fi;