# zfsnap-aur-package
An Arch Linux User Repository package for zfsnap

# Building
To build and test `PKGBUILD` and generate `.SRCINFO`, run:

```shell
make
```

It will build the package, check it for errors with `namcap`, and leave only the
built package file in the directory, assuming everything went well!
