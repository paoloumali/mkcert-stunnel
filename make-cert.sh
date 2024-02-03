#!/usr/bin/env bash

domain=$1
mkdir $domain; cd $domain;
mkcert -key-file $domain-key.pem -cert-file $domain-cert.pem $domain *.$domain
cat $domain-key.pem $domain-cert.pem > $domain-bundle.pem
chmod 600 $domain-bundle.pem
