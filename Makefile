ZFSNAP_AUR_DIR=zfsnap-aur

all: build

build: clean package check

# Remove everything but the core files.
clean:
	rm -rf \
		"${ZFSNAP_AUR_DIR}" \
		pkg/ \
		src/ \
		*.tar.gz \
		*.pkg.tar.xz

# Ensure we built a good package.
check:
	namcap 'PKGBUILD'
	namcap *.pkg.tar.xz

# Build the package and its `.SRCINFO` file.
package:
	makepkg
	makepkg --printsrcinfo > '.SRCINFO'

# Make a "standard" commit with the minimum files for AUR upload.
aur: build
	git clone 'git+ssh://aur@aur.archlinux.org/zfsnap.git' "${ZFSNAP_AUR_DIR}"
	cp PKGBUILD .SRCINFO "${ZFSNAP_AUR_DIR}"
	cd "${ZFSNAP_AUR_DIR}" && \
		git add . && \
		git commit --all --edit --message='Release X.Y.Z'
