install-dep:
	pip install -r scripts/requirements.txt
	east sys-setup
	# Below line is needed, as the toolchain manager might be cached, but not configured
	~/.local/share/east/nrfutil-toolchain-manager.exe config --install-dir ~/.local/share/east

project-setup:
	west init -l .
	west update -o=--depth=1 -n
	east update toolchain

pre-build:
	echo "Pre-build"

build:
	east release

pre-package:
	mkdir -p artifacts
	cp release/*.zip artifacts
	cp scripts/pre_changelog.md artifacts
	cp scripts/post_changelog.md artifacts
