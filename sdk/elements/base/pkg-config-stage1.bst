kind: myautotools
description: pkg-config

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/pcre.bst

variables:
  conf-local: |
    --with-internal-glib

sources:
  - kind: tar
    url: https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
    ref: 6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591
