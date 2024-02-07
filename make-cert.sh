#!/usr/bin/env bash

domain=$1

ssldir=$(realpath $(dirname $0))
cd $ssldir
mkdir $domain; cd $domain;
mkcert -key-file key.pem -cert-file cert.pem $domain *.$domain
cat key.pem cert.pem > bundle.pem
chmod 600 bundle.pem
