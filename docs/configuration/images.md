# Image Loading

## Quick Load

FIXME: add content

## Simple Image Series

![Simple Image Series Dialog](img/simple_image_series_dialog.png)

FIXME: add content

## Image Stack

FIXME: add content

## LLNL Import Tool

The LLNL workflow has its own import tool designed to allow one or more images to be loaded, transformed, and cropped before loading them into the GUI for analysis. To get started, launch the tool by going to `File->Import->LLNL Import Tool`.

![LLNL Import Menu Option](img/menu_llnl_import.png)

Once the import tool has opened, you have the option to dock it in the GUI or allow it to remain as a standalone dialog.

![Dock LLNL Import Tool](img/dock_llnl_import.gif)

### Instrument Configuration

To begin, select the instrument you will be using, and then select an instrument configuration. This configuration will need to include information about all of the expected detectors for the selected instrument. See examples for [TARDIS](https://github.com/HEXRD/hexrd/blob/master/hexrd/resources/tardis_reference_config.yml) and [PXRDIP](https://github.com/HEXRD/hexrd/blob/master/hexrd/resources/pxrdip_reference_config.yml).

*Note*: you may skip detectors for which you do not have data

![LLNL Instrument and Config Selection](img/instrument_and_config.png)

You'll notice that there are a few options for how to load a config:

1. **Current Configuration**: This will used the current instrument config
2. **Load Configuration**: If selected, you may then either use the default configuration file that we provide or load your own. Uncheck the `Default` box to load your own configuration.

If you are unsure what to use, try the default config. For more information on configuration files see the [instrument](instrument.md) section of the docs.

### Raw Image

Once the instrument and configuration have been selected the `Raw Image` portion of the form will be enabled and the list of available detectors will be populated. The detector selected from the drop-down menu will determine which template will be added to the image, as well as what default transform is suggested when the image is loaded. Use the `Select Image` button to load an image.

![LLNL Image Load With Deafult Transform](img/select_image_llnl.png)

If there is a default transform associated with the current instrument or selected detector, this will automatically be set in the load image dialog. This can still be changed either on load or in the import tool after the image is loaded.

Once the image is loaded, the template will be added, and you will be able to translate it or rotate it until it is positioned over the image. Once everything looks good, you can accept this by clicking the `Save detector boundary` button.

![Manipulate LLNL Template Position](img/manipulate_template.gif)

Depending on the instrument you are using, you will then follow one of two patterns for the remaining detectors:

1. **Single Image**: Instruments like PXRDIP and BBXRD have a single image with multiple detectors that will be cropped. In cases like these you can simply select a new detector from the drop-down menu and that template will be applied. As each boundary is accepted the dashed lines will remain so that it is clear what has already been cropped.
2. **Multi-Image**: Instruments like TARDIS have an image per detector. For these cases, the next detector should be chosen before the next image is loaded (although it is not neccessary, that can still be changed after) and the new template will not be applied until that new image is loaded.

For either path, toggling the selected detector before clicking `Save detector boundary` will just change the current template.

*Note*: For TARDIS Image Plate 3, the full boundary of the plate is displayed during interaction in order to make it easier to align, but after it is saved you will see the boundary shrink. This is cropping off unusable data at the edges.

![TARDIS IP3 Crop](img/TARDIS_IP3.gif)

### Edit Detector Outline

Depending on the image or current color map, the default style settings for the template may make it hard to see, or you may want to differentiate between multiple detectors with different boundaries. For these needs there is the option to change the color, line style and thickness.

![Template Style Options](img/template_style.gif)

For the PXRDIP instrument the bounding box inputs will also be enabled. There is sometimes a need to edit the exact size of these templates and these inputs allow for that. At the moment this only applies to PXRDIP and only allows the boundaries to be made smaller than the defaults.

### Finalize Instrument

Each time that a template is saved its name is added to the `Finalize Instrument` section and the option to `Complete and Reload Instrument` is enabled.

![Finalize LLNL Instrument Information](img/finalize_llnl.png)

At any point in the workflow you can use the `Cancel LLNL Import` to clear the progress you've made and return everything to its defaults. This is the only way to re-enable instrument selection once the first image has been loaded.

If everything seems correct you can select `Complete and Reload Instrument`. This will crop all of the images as well as build a new configuration with updated row and column sizes as well as tilt values (if appropriate). The configuration that you selected at the very beginning will be used for this step and will just be updated internally where necessary. This new configuration as well as the newly cropped images will all be loaded into the GUI.

![LLNL Save and Reload](img/save_and_reload.gif)

*Note*: This does **not** modify your original configuration file. You can save this new config through `File->Save->Configuration` and the images through `File->Save->Images`, or you can save everything as a state file with `File->Save->State`. For more detailed information on state files see the doc [here](state.md).
