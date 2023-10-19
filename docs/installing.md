# Installing

HEXRDGUI may be installed through several different methods:

* [Conda](#release)
* [Binary Packages](#binary-packages)
* [Pip](#pip)

## Conda

**Requires Python 3.11**

### Conda Environment

For any conda installation, it is **highly** recommended that you use separate
conda environments for separate applications. This is because different
applications in the same environment may break each others' installation.

For HEXRDGUI, the first step, then, would be to create and activate a conda
environment, like so:

```bash
conda create -n hexrdgui
conda activate hexrdgui
```

You should see a `(hexrdgui)` near the start of your terminal when the `hexrdgui`
conda environment is active. Only install `hexrd` and `hexrdgui` into this conda
environment (along with their dependencies). Do not install other packages. You
may deactivate the `hexrdgui` conda environment by running `conda deactivate`.
Notice that after you do this, `(hexrdgui)` should no longer appear near the
start of your terminal.

Any time you open a new terminal/console, and you wish to run `hexrdgui`, you must
run `conda activate hexrdgui` first in order to activate the environment. Look for
the `(hexrdgui)` at the start of your terminal to see if it is active.

#### Mamba Solver

Conda has a sophisticated system for determining which versions of dependencies
to install so that all dependencies are compatible with one another.
However, the default conda dependency solver can be very slow. For HEXRDGUI
installations, we have often seen the default solver take a long time, and we
have sometimes even witnessed the solver run indefinitely without ever
finishing. This would make HEXRDGUI impossible to install!

Fortunately, conda officially supports another solver: the
[libmamba solver](https://www.anaconda.com/blog/a-faster-conda-for-a-growing-community),
which is the solver used by [mamba](https://mamba.readthedocs.io/en/latest/).

Installing and setting up this solver will typically make your `conda install`
and `conda update` commands **significantly** faster. If you do not have
the libmamba solver installed in your base conda environment, start with this
command:

```bash
conda install -n base -c conda-forge conda-libmamba-solver
```

Next, while your [HEXRDGUI conda environment](#conda-environment) is active,
run the following command to use the libmamba solver in that environment:

```bash
conda config --env --set solver libmamba
```

If you wish to use libmamba in all of your environments (not just your HEXRDGUI
environment), remove the `--env` part.

Now, all of your `conda install` and `conda update` commands should run
significantly faster!

### Release
To install the latest stable release, run the following command:

```bash
conda install -c hexrd -c conda-forge python=3.11 hexrdgui
```

#### Updating the release

If you already have an environment with a release installed, and you wish to
update to the latest release, run the following command:

```bash
conda update -c hexrd -c conda-forge hexrd hexrdgui
```

This will update both `hexrd` and `hexrdgui` to the latest release.

### Prerelease
To install the latest changes on master, run the following:

```bash
conda install -c hexrd/label/hexrd-prerelease -c hexrd/label/hexrdgui-prerelease -c conda-forge python=3.11 hexrdgui
```

Note that the prerelease may be unstable.

#### Updating the prerelease

If you already have an environment with a prerelease installed, and you wish to
update to the latest prerelease, run the following command:

```bash
conda update -c hexrd/label/hexrd-prerelease -c hexrd/label/hexrdgui-prerelease -c conda-forge hexrd hexrdgui
```

This will update both `hexrd` and `hexrdgui` to the latest prerelease.

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

**Requires Python 3.11**

First clone the Git repositories:

```bash
git clone https://github.com/HEXRD/hexrd.git
git clone https://github.com/HEXRD/hexrdgui.git
```

### Conda

Ensure that Python 3.11 is installed in your environment. If it is not, run the following command:
```bash
conda install -c conda-forge python=3.11
```

Next, install the dependencies using the prerelease conda package:
```bash
conda install -c hexrd/label/hexrdgui-prerelease -c hexrd/label/hexrd-prerelease -c conda-forge hexrdgui
```

Finally, from the directory containing the hexrd and hexrdgui git repositories, use pip to link into the environment for development:

#### Linux and Mac OS X
```bash
pip install --no-build-isolation --no-deps -U -e hexrd
pip install --no-build-isolation --no-deps -U -e hexrdgui
```

#### Windows
```bash
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
