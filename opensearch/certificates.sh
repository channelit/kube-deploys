#!/bin/sh
# Root CA
openssl genrsa -out root-ca-key.pem 2048
openssl req -new -x509 -sha256 -key root-ca-key.pem -subj "/C=CA/ST=ONTARIO/L=TORONTO/O=ORG/OU=UNIT/CN=ROOT" -out root-ca.pem -days 730
# Admin cert
openssl genrsa -out admin-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in admin-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out admin-key.pem
openssl req -new -key admin-key.pem -subj "/C=CA/ST=ONTARIO/L=TORONTO/O=ORG/OU=UNIT/CN=ADMIN" -out admin.csr
openssl x509 -req -in admin.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out admin.pem -days 730
# Node cert 1
openssl genrsa -out node1-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in node1-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out node1-key.pem
openssl req -new -key node1-key.pem -subj "/C=CA/ST=ONTARIO/L=TORONTO/O=ORG/OU=UNIT/CN=node1.example.com" -out node1.csr
openssl x509 -req -in node1.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out node1.pem -days 730
# Node cert 2
openssl genrsa -out node2-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in node2-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out node2-key.pem
openssl req -new -key node2-key.pem -subj "/C=CA/ST=ONTARIO/L=TORONTO/O=ORG/OU=UNIT/CN=node2.example.com" -out node2.csr
openssl x509 -req -in node2.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out node2.pem -days 730
# Node cert 3
openssl genrsa -out node3-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in node3-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out node3-key.pem
openssl req -new -key node3-key.pem -subj "/C=CA/ST=ONTARIO/L=TORONTO/O=ORG/OU=UNIT/CN=node2.example.com" -out node3.csr
openssl x509 -req -in node3.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out node3.pem -days 730
# Client cert
openssl genrsa -out client-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in client-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out client-key.pem
openssl req -new -key client-key.pem -subj "/C=CA/ST=ONTARIO/L=TORONTO/O=ORG/OU=UNIT/CN=CLIENT" -out client.csr
openssl x509 -req -in client.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out client.pem -days 730
# Cleanup
rm admin-key-temp.pem
rm admin.csr
rm node1-key-temp.pem
rm node1.csr
rm node2-key-temp.pem
rm node2.csr
rm node3-key-temp.pem
rm node3.csr
rm client-key-temp.pem
rm client.csr
# Add Secrets
kubectl create secret generic opensearch-certs --from-file=admin-key.pem=admin-key.pem --from-file=admin.pem=admin.pem --from-file=client.pem=client.pem --from-file=client-key.pem=client-key.pem --from-file=node1.pem=node1.pem --from-file=node1-key.pem=node1-key.pem --from-file=node2.pem=node2.pem --from-file=node2-key.pem=node2-key.pem --from-file=node3.pem=node3.pem --from-file=node3-key.pem=node3-key.pem --from-file=root-ca.pem=root-ca.pem --from-file=root-ca-key.pem=root-ca-key.pem --from-file=root-ca.srl=root-ca.srl -n opensearch
# Cleanup
rm admin.pem
rm admin-key.pem
rm client.pem
rm client-key.pem
rm node1.pem
rm node1-key.pem
rm node2.pem
rm node2-key.pem
rm node3.pem
rm node3-key.pem
rm root-ca.pem
rm root-ca.srl
rm root-ca-key.pem
