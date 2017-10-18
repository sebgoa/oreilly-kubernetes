This lab aims at testing red/blue deployments, using a simple nginx page showing a blue or red page.
It uses an Ingress controller to load-bamance between the different pods of the Service named red.
It also uses two configmaps to store the two index.html files.

Just create the K8s resources in the correct order :
1) configmaps
2) red deployment
3) red Service
4) blue deployment
5) Ingress (redblue)

Then, connect to http://redblue.192.168.99.100.nip.io/ and see the wonderful red page.

Edit the label on one of the blue pod, to have run=test, instead of run=blue.

Reload the webpage a few times.