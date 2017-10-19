#### A small demo of how a configmap gets updated inside a running pod.

Steps:
 
1- Create the configmap:

kubectl create -f configmap.yaml

2- Create the pod

kubectl create -f pod.yaml

3- Get the logs from the pod:

kubectl logs -f busybox

4- on another terminal run the update-configmap.sh script

./update-configmap.sh

5- check the logs to see how the confimap data changes inside the running pod