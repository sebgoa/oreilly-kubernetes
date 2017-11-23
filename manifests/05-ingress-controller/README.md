![oreilly-logo](./images/oreilly.png) ![k8s](./images/k8s.png)

# Ingress Controller chapter
This chapter includes the creation of a simple Ingress controler attached to an nginx pod
ghost.yaml is just an example of a controller creation
ingress.yaml will create the full deployment

wordpress.yaml and game.yaml will create each an ingress controller, servicing port 80 for services named game and ingress
frontend.yaml creates also an ingress controller for port 80 of an nginx service

backend.yaml is a more complex example, which will create two Replication controllers, http-backend and nginx-ingress-controller, along with the necessary services.