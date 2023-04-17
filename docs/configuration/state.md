# State

State files are intended to contain nearly the entire state of the HEXRDGUI program
at the time of their creation. They include the following:

* Instrument configuration
* Images
* Materials
* Masks
* Calibration picks
* GUI Settings

An example state file that does not include the images may be found
[here](https://github.com/HEXRD/examples/blob/master/NIST_ruby/multiruby_dexelas/include/dexelas_id3a_20200130.h5).

## Known Limitations

Although we try to be as thorough as we can with the state file, there are some known
limitations present:

### Overwriting the Currently Loaded in State File

This sometimes works. But it also sometimes has issues.

The challenge is that in HEXRDGUI, we hold open a reference to the file containing
images. So if we want to write over the currently loaded state file, we must
perform some extra steps, including writing the current state to a temporary
directory, then closing the current state file, replacing the old state file with
the one from the temporary directory, and then opening the new state file.

This doesn't always work properly. Thus, it can often be safer and simpler to write to
a new state file, rather than writing over the currently opened one.

### Writing an Aggregated ImageSeries

If an aggregated image series is loaded into the GUI, we will still hold a reference
to the unaggregated images and use them for a variety of operations, including the
ones in the HEDM workflow.

However, the GUI currently only writes out the aggregated image series to a state
file. Thus, if you write it out to a state file, and then load it back in, the
unaggregated images will be missing.

This issue is tracked [here](https://github.com/HEXRD/hexrdgui/issues/1122).

### Writing a Frame Cache to a State File

Frame cache images are sparse images. But we are currently not writing them out as
sparse images, but expanding them to their full images. This can easily overload
computer resources.

This issue is being tracked [here](https://github.com/HEXRD/hexrdgui/issues/1401).
