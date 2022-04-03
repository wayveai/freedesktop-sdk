#!/bin/bash

set -eux

[ -d files/boot-keys ] || mkdir -p files/boot-keys
cd files/boot-keys

rm -f {PK,KEK,DB,VENDOR}.{crt,key,cer,auth,esl}
umask 0077

for key in PK KEK DB VENDOR; do
  openssl req -new -x509 -newkey rsa:2048 -subj "/CN=Freedesktop SDK ${key} key/" -keyout "${key}.key" -out "${key}.crt" -days 3650 -nodes -sha256
  openssl x509 -inform PEM -outform DER -in "${key}.crt" -out "${key}.cer"
done

cert-to-efi-sig-list -g "$(uuidgen)" PK.crt PK.esl
sign-efi-sig-list -k PK.key -c PK.crt PK PK.esl PK.auth

cert-to-efi-sig-list -g "$(uuidgen)" KEK.crt KEK.esl
sign-efi-sig-list -a -k PK.key -c PK.crt KEK KEK.esl KEK.auth

cert-to-efi-sig-list -g "$(uuidgen)" DB.crt DB.esl
sign-efi-sig-list -a -k KEK.key -c KEK.crt DB DB.esl DB.auth
