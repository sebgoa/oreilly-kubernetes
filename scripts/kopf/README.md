# Kopf minimal example

Create the CRD

```
kubectl apply -f crd.yaml
```

Start the operator:

```bash
kopf run example.py --verbose
```

Create the custome object

```bash
kubectl apply -f obj.yaml
kubectl get book
```
