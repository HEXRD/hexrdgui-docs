# Instrument

The instrument configuration can be a great starting point for analysis.
This configuration includes information such as the beam energy, beam vector,
and the number, type, and positions of detectors. There are a variety of ways to
configure the instrument. A brief summary is provided below.

## Loading and Saving

The simplest way to configure an instrument is to load a pre-existing configuration.
These configurations are contained in either yaml files or HEXRD (an HDF5 file with a
`.hexrd extension`) files. Loading a state file will also set the instrument
configuration (see [state files](state.md)).

To load an instrument configuration, click `File->Open->Configuration`, and then
select an instrument configuration file. A few examples can be found here:

* [PXRDIP](https://github.com/HEXRD/hexrd/blob/master/hexrd/resources/pxrdip_reference_config.yml)
* [TARDIS](https://github.com/HEXRD/hexrd/blob/master/hexrd/resources/tardis_reference_config.yml)
* [GE](https://github.com/HEXRD/examples/blob/master/NIST_ruby/single_GE/include/ge_detector_hexrd03.yml)
* [Dexelas](https://github.com/HEXRD/examples/blob/master/NIST_ruby/multiruby_dexelas/include/dexelas_id3a_20200130.yml)

When you are satisfied with your instrument configuration, you may save it to a file
via `File->Save->Configuration`. You can then select either a yaml or HEXRD
file format. The yaml format has the benefit of being easier to read, but the HEXRD
format is necessary for configurations that include, for instance, 2D panel buffers.

There are several ways to manually configure an instrument. Those methods will be
covered below.

## Tree View

![Tree View](img/instrument_tree_view.png)

The tree view provides a yaml-like view of your instrument configuration. It can be
helpful especially if you are familiar with using the HEXRD yaml files.

In this view, you are able to see and edit most of the values in the instrument
configuration. Any edits should cause a live update in the image canvas (as long
as `View->Show Live Updates` is checked). You are also able to edit which parameters
are refinable here, which is helpful if you plan to run a calibration later (see
[refinements](../calibration/refinements.md) for more details about
calibration refinements).

There are some context menu options available if you right-click a row in the tree
view. For instance, you may collapse/show a row and all of its children, or
check/uncheck the refinable option for a row and all of its children.

## Form View

![Form View](img/instrument_form_view.png)

The form view uses widgets to display the instrument configuration, and it offers
some additional methods for configuring the instrument.

For instance, if the x-ray was produced by burning a metal foil, it may be selected
through the ["Select Energy from X-Ray Table" button](#x-ray-energy-selection).
The beam vector can be specified by either polar or cartesian
coordinates. Whether or not there is a finite source distance (used primarily for
[pinhole distortion methods](overlays.md#pinhole-distortion)) may be specified. A distortion
function may be applied (such as `GE_41RT`). And detectors can be added (with the
`+` button), removed (with the `-` button), or renamed (using the combo box in the
"Detector Parameters" section).

In the form view, a gray background for the widgets indicates that they are not
refinable (see [the refinements section](../calibration/refinements.md)) during
calibration.

### X-Ray Energy Selection

![X-Ray Energy Selection](img/x-ray_energy_selection.png)

In the form view, if the "Select Energy from X-Ray Table" button is clicked, the
above dialog should appear.

If the x-ray was produced by burning a metal foil, the x-ray energy may be selected
through this dialog.

The displayed table provides absorption edges and emission lines for a variety of elements.
A single row can be selected to use the energy of that entry, or multiple rows can
be selected, in which case, their energies will be averaged together.

### Panel Buffers

![Panel Buffer](img/panel_buffer.png)

If `Configure Panel Buffer` is clicked, then the panel buffer options for the
currently selected detector will appear. The panel buffer is used to exclude some
pixels in the images from the view modes and various analysis methods.

The `Border` mode of the panel buffer indicates that pixels along the borders should
be excluded. The input is in `mm`, and the number of pixels excluded is computed
automatically from this.

Alternatively, a NumPy array (`.npy` file) may be provided. This is a 2D boolean
array that matches the shape of the detector exactly, and it explicitly indicates which
pixels should be kept/ignored. This array can be viewed by clicking `Show Panel Buffer`.

![Epix Quad Panel Buffer](img/epix_quad_panel_buffer.png)

Purple pixels are excluded, and yellow pixels are included.

The panel buffer may also be cleared entirely by clicking `Clear Panel Buffer`.

## Slider View

![Slider View](img/instrument_slider_view.png)

The slider view provides interactive sliders for editing detector and beam parameters.
For editing detector parameters, the detector must be specified in the combo box at the
top.

The "Slider Range" for each section indicates what the range of the slider will be.
Note that modifying the slider range will also reset the slider to the center of the
range (which is necessary to go beyond the original ranges).

One use case for the slider view is to roughly set the detector parameters manually
("eyeball" it), so that any automatic calibration afterwards is more likely to succeed.
For instance, if one detector is translated incorrectly, as shown below:

![Slider View Before Adjustment](img/slider_view_before_adjustment.png)

The sliders can be used to interactively move the detector to roughly the correct
position:

![Slider View After Adjustment](img/slider_view_after_adjustment.png)

This can help ensure that calibration will succeed.

The `Reset Configuration` button at the bottom may be used to reset the
configuration (see [here](#resetting-the-instrument-configuration) for more
details).

## Additional Details

### Euler Angle Convention

Since the detectors are in 3D space, their tilt angles can be displayed and specified
using a variety of conventions. By default, HEXRDGUI uses the `Extrinsic XYZ` Euler
angle convention. This is modifiable, however, under `Edit->Euler Angle Convention`.

Currently, the other options are `None` (which uses the exponential map parameters),
and `Intrinsic ZXZ`.

The tree view, form view, and slider view will all display their detector tilt angles
using the selected Euler angle convention.

### Resetting the Instrument Configuration

When the instrument configuration is first loaded, it is saved internally, so that it
may be restored at any time by clicking the `Reset Configuration` button. This
feature is available in both the slider view, and via `Edit->Reset Instrument Config`.
