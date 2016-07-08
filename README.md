# zfsnap-aur-package
The Arch Linux User Repository package for [`zfsnap`](https://github.com/zfsnap/zfsnap).

# Building
To build and test `PKGBUILD` and generate `.SRCINFO`, run:

```shell
make build
```

This will build the package and check it for errors with `namcap`.

# Updating the AUR
To upload the current file to the AUR, run:

```shell
make aur
```

This will clone the AUR package's git repository, copy the necessary files into
it, and create a "standard" commit for releasing a new version.

Once this has been done, it's up to you to push the changes!
