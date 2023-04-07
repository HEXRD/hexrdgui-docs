# Instrument

## Cylindrical Detectors

The ray cylinder intersection is solved efficiently using vectorial equations. A unit vector, $\hat{\mathbf{u}}$ intersects a cylinder of radius, $R$ and the symmetry axis along the unit vector $\hat{\mathbf{c}}$ at the point $\beta\hat{\mathbf{u}}$, where $\beta$ is given by the equation
$$\beta = {(\hat{\mathbf{u}}\cdot\overrightarrow{\pmb{\delta}} - (\hat{\mathbf{u}}\cdot\hat{\mathbf{c}})(\hat{\mathbf{c}}\cdot\overrightarrow{\pmb{\delta}})) \pm \sqrt{(\hat{\mathbf{u}}\cdot\overrightarrow{\pmb{\delta}} - (\hat{\mathbf{u}}\cdot\hat{\mathbf{c}})(\hat{\mathbf{c}}\cdot\overrightarrow{\pmb{\delta}}))^2 + (R^2 + (\hat{\mathbf{c}}\cdot\overrightarrow{\pmb{\delta}})^2 - \vert\overrightarrow{\pmb{\delta}})\vert^{2})(1 - (\hat{\mathbf{u}}\cdot\hat{\mathbf{c}})^2)} \over 1 - (\hat{\mathbf{u}}\cdot\hat{\mathbf{c}})^2}$$
The vector, $\overrightarrow{\pmb{\delta}}$ is defined as the vector connecting the origin of the lab frame to the origin of the cylinder. This is shown in the figure below.

<p align="center">
<img width="447" alt="Screen Shot 2023-04-06 at 9 39 12 PM" src="https://user-images.githubusercontent.com/15834451/230542019-89108613-c487-48e7-a06e-9b74816087f5.png">
  </p>

