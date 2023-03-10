This repository hosts [HEXRDGUI][hexrdgui] documentation using the
[MkDocs][mkdocs] package. It can be built locally, and it is also hosted on
[readthedocs][rtd]. To contribute, please fork the repository, create a
feature branch, and open a pull request.

Building Locally
----------------

First clone the repository, and then get your environment set up.

    git clone git://github.com/hexrd/hexrdgui-docs
    cd hexrdgui-docs

Using Python 3, run the following commands to install the documentation
requirements and start the server:

    pip install -r requirements.txt
    mkdocs serve -a localhost:8089

This will set up a local server on port 8089 which you can view in your
preferred browser at: http://localhost:8089/.

Alternatively, you may run the `serve.sh` script, which does essentially
the same thing.

![Kitware, Inc.][KitwareLogo]

  [hexrdgui]: https://github.com/hexrd/hexrdgui/ "The HEXRDGUI project"
  [hexrd_logo]: https://github.com/hexrd/hexrdgui-docs/blob/master/docs/img/hexrd_logo.png "HEXRDGUI"
  [KitwareLogo]: http://www.kitware.com/img/small_logo_over.png "Kitware"
  [mkdocs]: https://www.mkdocs.org/
  [rtd]: https://hexrdgui.readthedocs.io/
