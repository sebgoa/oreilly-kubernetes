#!/bin/sh
set -e -x

apt-get --yes --quiet update
apt-get --yes --quiet install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get --yes --quiet install docker-ce

usermod -aG docker ubuntu 

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install --yes kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

kubeadm init

# for the ubuntu user
mkdir -p /home/ubuntu/.kube
cp -i /etc/kubernetes/admin.conf /home/ubuntu/.kube/config
chown 1000:1000 /home/ubuntu/.kube/config

# for the root user
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/master-

sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

wget https://get.helm.sh/helm-v2.14.1-linux-amd64.tar.gz
tar xzvf helm-v2.14.1-linux-amd64.tar.gz
mv ./linux-amd64/helm /usr/local/bin

export ISTIO_VERSION=1.1.3
curl -L https://git.io/getLatestIstio | sh -
cd istio-1.1.3/
for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: istio-system
  labels:
    istio-injection: disabled
EOF

helm template --namespace=istio-system \
--set prometheus.enabled=false \
--set mixer.enabled=false \
--set mixer.policy.enabled=false \
--set mixer.telemetry.enabled=false \
`# Pilot doesn't need a sidecar.` \
--set pilot.sidecar=false \
--set pilot.resources.requests.memory=128Mi \
`# Disable galley (and things requiring galley).` \
--set galley.enabled=false \
--set global.useMCP=false \
`# Disable security / policy.` \
--set security.enabled=false \
--set global.disablePolicyChecks=true \
`# Disable sidecar injection.` \
--set sidecarInjectorWebhook.enabled=false \
--set global.proxy.autoInject=disabled \
--set global.omitSidecarInjectorConfigMap=true \
`# Set gateway pods to 1 to sidestep eventual consistency / readiness problems.` \
--set gateways.istio-ingressgateway.autoscaleMin=1 \
--set gateways.istio-ingressgateway.autoscaleMax=1 \
`# Set pilot trace sampling to 100%` \
--set pilot.traceSampling=100 \
install/kubernetes/helm/istio \
> ./istio-lean.yaml

kubectl apply -f istio-lean.yaml
