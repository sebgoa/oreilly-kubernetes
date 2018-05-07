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
            imagePullPolicy: Never
            workingDir: /tmp/cookie/opencompose-jsonnet
            env:
            - name: TOKEN
              valueFrom:
                secretKeyRef:
                  name: {{ token_name }}
                  key: token
            command: ["kubecfg"]
            args:
            - --certificate-authority
            - /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
            - --token
            - $(TOKEN)
            - --server
            - https://kubernetes:443
            - update
            - {{ app }}
            volumeMounts:
            - name: cookie
              mountPath: /tmp/cookie
          restartPolicy: OnFailure
          volumes:
          - name: cookie
            gitRepo:
              repository: {{ repo }}
"""

def render(name, app, repo):
    template = jinja2.Template(svc)
    app = template.render(name=name, app=app, repo=repo, token_name=get_sa_secret())
    return app.decode()
    
    
def get_sa_secret():
    kubernetes.config.load_kube_config()
    v1 = kubernetes.client.CoreV1Api()
    for sa in v1.list_namespaced_service_account(namespace="default").items:
        if sa.metadata.name == "default":
            return sa.secrets[0].name
