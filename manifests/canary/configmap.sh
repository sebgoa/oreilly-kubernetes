#!/bin/sh
kubectl create configmap red --from-file=red-files/index.html
kubectl create configmap blue --from-file=blue-files/index.html
