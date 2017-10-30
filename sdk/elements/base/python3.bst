kind: myautotools
description: Python 3

depends:
  - filename: bootstrap-import.bst
  - filename: base/zlib.bst

variables:
  conf-extra: |
    --enable-shared \
    LDFLAGS="-L%{libdir}"

config:
  install-commands:
    (>):
      - |
        ln -s "../%{triple}/python3.6/lib-dynload" "%{install-root}/usr/lib/python3.6/lib-dynload"

sources:
  - kind: tar
    url: https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
    ref: cda7d967c9a4bfa52337cdf551bcc5cff026b6ac50a8834e568ce4a794ca81da
