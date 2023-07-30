#############
# Variables #
#############

GODOT_VERSION=4.1.1
RELEASE_NAME=stable
SUBDIR=
GODOT_PLATFORM=linux.x86_64
GODOT_FILENAME=Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${GODOT_PLATFORM}
GODOT_TEMPLATE=Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz

#############
# Commands  #
#############

mkflower:
	mkdir -p .mkflower
	mkdir -p .mkflower/build
	mkdir -p .mkflower/bin
	mkdir -p .mkflower/tmp

	touch .mkflower/.gitignore
	echo '*' >> .mkflower/.gitignore
	
	touch .mkflower/.gdignore

install_godot: mkflower
	# curl -X GET "https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/SHA512-SUMS.txt" --output .mkflower/tmp/SHA512-SUMS.txt
	# if [ ! -f ".mkflower/tmp/${GODOT_FILENAME}" ] || [ "$(cat .mkflower/tmp/SHA512-SUMS.txt | grep ${GODOT_FILENAME} | awk -F'[[:space:]]+' '{print $1}')" != "$(sha256sum .mkflower/tmp/${GODOT_FILENAME})" ]; then \
	curl -X GET "https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}${SUBDIR}/${GODOT_FILENAME}.zip" --output .mkflower/tmp/${GODOT_FILENAME}.zip; \
	unzip .mkflower/tmp/${GODOT_FILENAME}.zip -d .mkflower/tmp/; \
	cp .mkflower/tmp/${GODOT_FILENAME} .mkflower/bin/${GODOT_FILENAME};
	# fi

install_templates: mkflower
	curl -X GET "https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}${SUBDIR}/${GODOT_TEMPLATE}" --output .mkflower/tmp/${GODOT_TEMPLATE}; \
	unzip .mkflower/tmp/${GODOT_TEMPLATE} -d .mkflower/tmp/; \
	mkdir -p ~/.local/share/godot/export_templates/${GODOT_VERSION}.${RELEASE_NAME}; \
	cp .mkflower/tmp/templates/* ~/.local/share/godot/export_templates/${GODOT_VERSION}.${RELEASE_NAME};

install_addons:
	.mkflower/bin/${GODOT_FILENAME} --headless --script plug.gd install || true

import_resources:
	.mkflower/bin/${GODOT_FILENAME} --headless --export-pack null /dev/null
	# timeout 60 .mkflower/bin/${GODOT_FILENAME} --editor || true
	# .mkflower/bin/${GODOT_FILENAME} --headless --quit --editor

export_release:
	.mkflower/bin/${GODOT_FILENAME} --export-release "Linux/X11" --headless .mkflower/build/GhostSnap.x86_64

editor:
	.mkflower/bin/${GODOT_FILENAME} --editor

godot:
	.mkflower/bin/${GODOT_FILENAME} $(ARGS)

run_release:
	.mkflower/build/GhostSnap.x86_64

clean_mkflower:
	rm -rf .mkflower

clean_godot:
	rm -rf .godot

clean_plug:
	rm -rf .plugged
	find addons/ -type d -not -name 'addons' -not -name 'gd-plug' -exec rm -rf {} \; || true

#############
# Playbook  #
#############

clean: clean_mkflower clean_godot clean_plug
build: clean_godot clean_plug install_addons import_resources export_release
run: build run_release

ci_build: clean install_godot install_templates install_addons import_resources export_release