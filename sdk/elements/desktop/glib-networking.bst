kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/libproxy.bst
  - filename: base/glib.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/gnutls.bst

variables:
  conf-local: |
    --with-libproxy \
    --with-ca-certificates=%{ca_path}

sources:
  - kind: tar
    url: https://download.gnome.org/sources/glib-networking/2.54/glib-networking-2.54.1.tar.xz
    ref: eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f
