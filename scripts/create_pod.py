#!/usr/bin/env python

from kubernetes import client, config

config.load_kube_config()

v1=client.CoreV1Api()

pod = client.V1Pod()
pod.metadata = client.V1ObjectMeta(name="busybox")

container = client.V1Container()
container.image = "busybox"
container.args = ["sleep", "3600"]
container.name = "busybox"

spec = client.V1PodSpec()
spec.containers = [container]
pod.spec = spec

v1.create_namespaced_pod(namespace="default",body=pod)
