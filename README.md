# local CA using mkcert

## Steps

- install mkcert
- install stunnel if you need it
    - start a service on port 8091, then do proxy below
    - sudo stunnel3 -f -d 443 -r 8091 -p localhost-bundle.pem

- use script like below:
    - ./make-cert.sh domain.com