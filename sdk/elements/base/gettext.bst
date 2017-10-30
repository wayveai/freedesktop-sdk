kind: myautotools
description: GNU gettext

depends:
  - filename: bootstrap-import.bst
  - filename: base/gzip.bst
    type: build

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz
    ref: 105556dbc5c3fbbc2aa0edb46d22d055748b6f5c7cd7a8d99f8e7eb84e938be4
