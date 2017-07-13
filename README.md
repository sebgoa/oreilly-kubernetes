![oreilly-logo](./images/oreilly.png) ![k8s](./images/k8s.png)

# Kubernetes Training and Cookbook

This repository contains instructions and examples for the O'Reilly Live Online Training for [Kubernetes](https://kubernetes.io).
Dates are listed in the [O'Reilly Live Online](https://www.safaribooksonline.com/live-training/) training schedule.

It also contains [examples and scripts](./cookbook) used in the Kubernetes [Cookbook](http://shop.oreilly.com/product/0636920064947.do).

## Prerequisites

In this training we will use [minikube](https://kubernetes.io/docs/getting-started-guides/minikube/) to run a local Kubernetes instance. We will access this local Kubernetes with the client called `kubectl`.

* Install [minikube](https://github.com/kubernetes/minikube/releases)
* Install [kubectl](https://kubernetes.io/docs/user-guide/prereqs/)

Verify your installation:

```
$ minikube version
minikube version: v0.16.0

$ minikube start

$ kubectl version
Client Version: version.Info{Major:"1", Minor:"5", GitVersion:"v1.5.2", GitCommit:"08e099554f3c31f6e6f07b448ab3ed78d0520507", GitTreeState:"clean", BuildDate:"2017-01-12T04:57:25Z", GoVersion:"go1.7.4", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"5", GitVersion:"v1.5.2", GitCommit:"08e099554f3c31f6e6f07b448ab3ed78d0520507", GitTreeState:"clean", BuildDate:"1970-01-01T00:00:00Z", GoVersion:"go1.7.1", Compiler:"gc", Platform:"linux/amd64"}
```

If you are impatient, you can now start playing with Kubernetes:

* Create a deployment with `kubectl run ghost --image=ghost`
* Do you see a running _Pod_ : `kubectl get pods`
* Check `kubectl --help` what can you do ?

## Links

* Kubernetes [website](https://kubernetes.io)
* Official Kubernetes [Documentation](https://kubernetes.io/docs/)
* Research paper describing [_Borg_](https://research.google.com/pubs/pub43438.html)
* Kubernetes YouTube [channel](https://www.youtube.com/channel/UCZ2bu0qutTOM0tHYa_jkIwg/featured)
* Cloud Native Computing Foundation Youtube [channel](https://www.youtube.com/channel/UCvqbFHwN-nwalWPjPUKpvTA/feed)

## Instructor

*Sebastien Goasguen* is a twenty year open source veteran. A member of the Apache Software Foundation, he worked on Apache CloudStack and Libcloud for several years before diving into the container world. He is the founder of [Skippbox](http://www.skippbox.com), a Kubernetes startup that develops open source tools for Kubernetes users. An avid blogger he enjoys spreading the word about new cutting edge technologies and also trains developers and sysadmins on all things Docker and Kubernetes. Sebastien is the author of the O’Reilly Docker Cookbook and 60 Recipes for Apache CloudStack.

## Code of Conduct

Since this is an official O'Reilly Training, we will adhere to the [O'Reilly conferences Code of Conduct](http://www.oreilly.com/conferences/code-of-conduct.html).

_"At O'Reilly, we assume that most people are intelligent and well-intended, and we're not inclined to tell people what to do. However, we want every O'Reilly conference to be a safe and productive environment for everyone. To that end, this code of conduct spells out the behavior we support and don't support at conferences."_

## Trademark

Kubernetes is a registered trademark of the [Linux Foundation](https://www.linuxfoundation.org/trademark-usage).
