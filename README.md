# local CA using mkcert

## Steps

- install mkcert
- install stunnel if you need it
    - start a service on port 8091, then do proxy below
    - sudo stunnel3 -f -d 443 -r 8091 -p localhost-bundle.pem

- use script like below:
    - ./make-cert.sh domain.com

```bash
#!/usr/bin/env bash

mkcert -key-file example.com-key.pem -cert-file example.com-cert.pem example.com *.example.com
cat example.com-key.pem example.com-cert.pem > example.com-bundle.pem
mkcert -key-file localhost-key.pem -cert-file localhost-cert.pem localhost *.localhost
cat localhost-key.pem localhost-cert.pem > localhost-bundle.pem
chmod 600 localhost-bundle.pem

# e.g. start a service on port 8091
sudo stunnel3 -f -d 443 -r 8091 -p localhost-bundle.pem

```
