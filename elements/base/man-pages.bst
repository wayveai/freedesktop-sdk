kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/man-pages-posix.bst

config:
  install-commands:
  - |
    make DESTDIR="%{install-root}" install

sources:
- kind: git
  url: https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
  ref: 7c76c80c8ea19217556179ffefc2296f78dba35e    # 4.16
