# Canary Demo

This demonstrates using 2 deployments to test new code alongside operational code. Each deployment can be scaled to change the proportion of data sent to each.

The static files are placed in sub-directories such that configMap can give them the correct filenames by default. Mounting these is demonstrated in `configmap.sh`.

Running this demo includes the following steps:
* Create the configMaps.
* Create the redblue service.
* Create the red deployment which will be captured by the redblue service.
* Scale the red deployment (if desired).
* Create the blue deployment which will also be captured by the redblue service due to its label, and will be roundrobinned alongside the red deployment.
* Scale the blue deployment (if desired).
* Scale down the red deployment (to 0) and delete it.
* Continue with the new deployment.

N.B: This approach was taken as editing the bluered deployment to update labels left a floating rs and pods. This approach managed the pods more 'nicely'
