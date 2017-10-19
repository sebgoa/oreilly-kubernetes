#!/bin/bash
sed -i 's/\-\s9090/- 8888/' configmap.yaml
kubectl apply -f configmap.yaml