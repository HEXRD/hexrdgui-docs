# Installing

HEXRDGUI may be installed through several different methods:

* [Conda](#release)
* [Binary Packages](#binary-packages)
* [Pip](#pip)

## Conda

**Requires Python 3.10**

### Release
To install the latest stable release, run the following command:

```bash
conda install -c hexrd -c conda-forge python=3.10 hexrdgui
```

### Prerelease
To install the latest changes on master, run the following:

```bash
conda install -c hexrd/label/hexrd-prerelease -c hexrd/label/hexrdgui-prerelease -c conda-forge python=3.10 hexrdgui
```

Note that the prerelease may be unstable.

### Running

For conda installs, HEXRDGUI may be launched by typing:
```bash
hexrdgui
```

See `hexrdgui --help` for some command line options.

## Binary Packages

Binary packages for Windows, Mac, and Linux can be found in the "Assets" attached to most of the main [releases](https://github.com/HEXRD/hexrdgui/releases).

Binary installs are native applications, and they are started on double-click.

## Development

**Requires Python 3.10**

First clone the Git repositories:

```bash
git clone https://github.com/HEXRD/hexrd.git
git clone https://github.com/HEXRD/hexrdgui.git
```

### Conda

Ensure that Python 3.10 is installed in your environment.  If it is not, run the following command:
```bash
conda install -c conda-forge python=3.10
```

Next, install the dependencies using the prerelease conda package:
```bash
conda install -c hexrd/label/hexrdgui-prerelease -c hexrd/label/hexrd-prerelease -c conda-forge hexrdgui
```

Finally, from the directory containing the hexrd and hexrdgui git repositories, use pip to link into the environment for development:

#### Linux and Mac OS X
```bash
CONDA_BUILD=1 pip install --no-build-isolation --no-deps -U -e hexrd
CONDA_BUILD=1 pip install --no-build-isolation --no-deps -U -e hexrdgui
```

#### Windows
```bash
set CONDA_BUILD=1;
pip install --no-build-isolation --no-deps -U -e hexrd;
pip install --no-build-isolation --no-deps -U -e hexrdgui
```

If you are running in Windows PowerShell or other environments where the stdout
and stderr is not appearing in the console, you can run the Python module directly
via `python hexrdgui/hexrd/ui/main.py`. You should then see stdout and stderr.

### Pip

Ensure the Git repositories [are cloned](#development). Then, install in
editable mode with `pip` by running the following commands:

```bash
pip install -e hexrd
pip install -e hexrdgui
```

This should also automatically install all dependencies from PyPI.

## Packages

Packages are built for every PR push, merge into master, or tag push. They are built using [GitHub Actions](https://github.com/features/actions).

The following packages are uploaded as artifacts:

- `HEXRDGUI-Linux-<version>.tar.bz2` - The Linux conda package.
- `HEXRDGUI-MacOSX-<version>.tar.bz2` - The MacOSX conda package.
- `HEXRDGUI-Windows-<version>.tar.bz2` - The Windows conda package.
- `HEXRDGUI-<version>.tar.gz` - The Linux package (tarball).
- `HEXRDGUI-<version>.dmg` - The MacOS package (DMG).
- `HEXRDGUI-<version>.msi` - The Windows package (MSI).
- `HEXRDGUI-<version>.zip` - The Windows package (zip).

Note: That the packages on MacOS and Windows are not signed.
