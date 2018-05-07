#!/usr/bin/env python

import jinja2
import kubernetes

svc ="""
apiVersion: batch/v2alpha1
kind: CronJob
metadata:
  name: {{ name }}
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: kubecfg
            image: kubecfg
"""

def render(name):
    template = jinja2.Template(svc)
    app = template.render(name=name)
    return app

print(render("foobar"))
