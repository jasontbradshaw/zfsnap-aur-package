all: clean package check distclean

# Remove everything but the core files.
clean:
	rm -rf \
		pkg/ \
		src/ \
		*.tar.gz \
		*.pkg.tar.xz

# Remove everything _except_ the built package file.
distclean:
	rm -rf \
		pkg/ \
		src/ \
		*.tar.gz

# Ensure we built a good package.
check:
	namcap PKGBUILD
	namcap *.pkg.tar.xz

# Build the package.
package:
	makepkg && makepkg --printsrcinfo > .SRCINFO
