#!/usr/bin/env bash

minicube_dir=.minikube
client_cert_dir=k8s_client_crts
client_username=employee



if openssl_bin=$(which openssl) ; then
    # Test minicube certs
    for i in crt key ; do
        if ! [ -f $HOME/$minicube_dir/ca.$i ] ; then
            echo "Unable to find ca.$i"
            exit 1
        else
            echo "OK: Found ca.$i"
        fi 
    done

    # Create cert directory
    if mkdir -p $HOME/$client_cert_dir ; then

        set -e
        # Generate certs
        $openssl_bin genrsa -out $HOME/$client_cert_dir/$client_username.key 2048 
        $openssl_bin req -new -key $HOME/$client_cert_dir/$client_username.key -out $HOME/$client_cert_dir/$client_username.csr -subj "/CN=$client_username/O=bitnami"  
        $openssl_bin x509 -req -in $HOME/$client_cert_dir/$client_username.csr -CA $HOME/$minicube_dir/ca.crt -CAkey $HOME/$minicube_dir/ca.key -CAcreateserial -out $HOME/$client_cert_dir/$client_username.crt -days 500 

        echo -e "\nCreated in $HOME/$client_cert_dir"  
        ls -1 $HOME/$client_cert_dir/*
        exit 0
    else
        echo "Unable to create $HOME/$client_cert_dir"
        exit 1
    fi   
else
    echo "Unable to find openssl binary in PATH"
    exit 1
fi







































































































































































































































#!/usr/bin/env bash

if openssl_bin=$(which openssl) ; then
    if [ -z $SUDO_USER ] ; then
        username=$USER
    else
        username=$SUDO
    
else
    echo "Sorry, unable to find openssl binary in path"

    mkdir -p $HOME/k8s_client_certificates
    
else
    echo "Sorry, unable to find openssl binary in path"
fi





 openssl genrsa -out employee.key 2048
 openssl req -new -key employee.key -out employee.csr -subj
 openssl req -new -key employee.key -out employee.csr -sub "/CN=employee/O=bitnami"
 openssl req -new -key employee.key -out employee.csr -subj "/CN=employee/O=bitnami"
 openssl x509 -req -in employee.csr -CA CA_LOCATION/ca.crt -CAkey CA_LOCATION/ca.key -CAcreateserial -out employee.crt -days 500
 openssl x509 -req -in employee.csr -CA /home/wire/.minikube/ca.crt -CAkey /home/wire/.minikube/ca.key -CAcreateserial -out employee.crt -days 500
  601  openssl rsa -check -in rv-osiris.key 
  602  openssl rsa -check -in rv-osiris.crt
 1967  openssl genrsa -out employee.key 2048
 1968  openssl req -new -key employee.key -out employee.csr -subj
 1969  openssl req -new -key employee.key -out employee.csr -sub "/CN=employee/O=bitnami"
 1970  openssl req -new -key employee.key -out employee.csr -subj "/CN=employee/O=bitnami"
 1971  openssl x509 -req -in employee.csr -CA CA_LOCATION/ca.crt -CAkey CA_LOCATION/ca.key -CAcreateserial -out employee.crt -days 500
 1972  openssl x509 -req -in employee.csr -CA /home/wire/.minikube/ca.crt -CAkey /home/wire/.minikube/ca.key -CAcreateserial -out employee.crt -days 500
 1998  history | grep openssl
 1999  history | grep openssl > napsat-script
 2013  mv napsat-script openssl-generate-certs.sh
 2014  vim openssl-generate-certs.sh 
 2015  test openssl
 2017  test openssl1
 2019  vim openssl-generate-certs.sh 
 2021  vim openssl-generate-certs.sh 
 2023  history | grep openssl 
 2024  history | grep openssl  >> openssl-generate-certs.sh 
