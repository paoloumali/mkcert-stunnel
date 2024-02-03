# local CA using mkcert


```bash
#!/bin/bash

mkcert -key-file example.com-key.pem -cert-file example.com-cert.pem example.com *.example.com
cat example.com-key.pem example.com-cert.pem > example.com-bundle.pem
mkcert -key-file localhost-key.pem -cert-file localhost-cert.pem localhost *.localhost
cat localhost-key.pem localhost-cert.pem > localhost-bundle.pem
chmod 600 localhost-bundle.pem

# install stunnel, to create secure ports
sudo apt install stunnel
# start a service on port 8091, then do proxy below
sudo stunnel3 -f -d 443 -r 8091 -p localhost-bundle.pem
```
