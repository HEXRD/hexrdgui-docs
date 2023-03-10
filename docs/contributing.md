# Contributing

## Contributing to the Documentation

The documentation is written in markdown, and it is hosted at
https://github.com/HEXRD/hexrdgui-docs

### Contributing Directly on GitHub

There are several ways to make contributions. One of the easiest
is to simply go to the markdown page on GitHub. You can easily
preview your changes as you make them.

For example, go [here](https://github.com/HEXRD/hexrdgui-docs/blob/master/docs/index.md).

At the top-right corner of the file, click the icon that looks like a
pencil and says "Edit this file" when you hover your mouse over it.

You may now edit the file directly on GitHub. Click the "Preview" button
to see a preview of the changes you have made.

When you are satisfied with your changes, scroll to the bottom and check
"Create a new branch for this commit and start a pull request." Write
a commit message, and click "Commit changes" to open up a pull request.

Note that you may edit the markdown files using this method, but you
cannot add images.

### Contributing Local Changes

Contributing local changes has the advantage that you may add image files.

First, clone the documentation repository:

```bash
git clone https://github.com/hexrd/hexrdgui-docs
```

To start a MkDocs server, run the following commands:

```bash
cd hexrdgui-docs
pip install -r requirements.txt
mkdocs serve -a localhost:8089
```

You may then visit http://localhost:8089 to view your changes live.
Any updates to the markdown files will automatically trigger that
web page to update.

Once the server is running, feel free to edit the markdown files and/or
add images. To add an image, copy the image file into an `img` directory
next to the markdown file where it will be displayed, and in the markdown
file, add a line similar to the following:

```md
![My Image](img/my_image.png)
```

Your image should then be displayed on the page where you added that line.

When you are satisfied with your changes, fork the main repository (click
the `Fork` button [here](https://github.com/hexrd/hexrdgui-docs)), and run
commands similar to the following:

```bash
# Create a new branch (replace <branch-name> with the name you chose for your branch)
git branch <branch-name>
git checkout <branch-name>

# Add any new files (including image files) and markdown files you edited
git add <file1> <file2> ...

# Add your fork. Replace <user> with your github username.
git remote add <user> https://github.com/<user>/hexrdgui-docs
git push <user> <branch-name>
```

Then visit `https://github.com/<user>/hexrdgui-docs/tree/<branch-name>`,
click the `Contribute` button, and click "Open pull request". You can edit
your pull request title and message and click "Create pull request" to
start the pull request.

At this point, the developers will be able to see your pull request and
can review it.
