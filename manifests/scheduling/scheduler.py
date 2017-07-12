#!/usr/bin/env python

import time
import random
import json

from kubernetes import client, config, watch

config.load_kube_config()
v1=client.CoreV1Api()

scheduler_name = "foobar"

def nodes_available():
    ready_nodes = []
    for n in v1.list_node().items:
            for status in n.status.conditions:
                if status.status == "True" and status.type == "Ready":
                    ready_nodes.append(n.metadata.name)
    return ready_nodes

def scheduler(name, node, namespace="default"):
    body=client.V1Binding()
        
    target=client.V1ObjectReference()
    target.kind="Node"
    target.apiVersion="v1"
    target.name= node
    
    meta=client.V1ObjectMeta()
    meta.name=name
    
    body.target=target
    body.metadata=meta
    
    return v1.create_namespaced_binding_binding(name, namespace, body)

def main():
    w = watch.Watch()
    for event in w.stream(v1.list_namespaced_pod, "default"):
        if event['object'].status.phase == "Pending" and event['object'].spec.scheduler_name == scheduler_name:
            try:
                res = scheduler(event['object'].metadata.name, random.choice(nodes_available()))
            except client.rest.ApiException as e:
                print json.loads(e.body)['message']
                    
if __name__ == '__main__':
    main()
