![oreilly-logo](./images/oreilly.png) ![k8s](./images/k8s.png)

# ReplicaSet 
Two files presented as an example.
redis-rc.yaml starts a RS with a redis image, with 2 replicas
rs-example.yaml starts a RS with an nginx image, with 3 replicas

Both are using a label to identify the pods, either an app label, or a "color" label.
