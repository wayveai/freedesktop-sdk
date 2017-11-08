kind: myautotools

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/libproxy.bst

variables:
  conf-extra: |
    --with-libproxy \
    --with-ca-certificates="/etc/ssl/certs/ca-certificates.crt"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/glib-networking/2.54/glib-networking-2.54.1.tar.xz
    ref: eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f
