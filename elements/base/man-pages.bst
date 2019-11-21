kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/man-pages-posix.bst

config:
  install-commands:
  - |
    make DESTDIR="%{install-root}" install

sources:
- kind: git_tag
  url: kernel:docs/man-pages/man-pages.git
  ref: man-pages-4.16-0-g7c76c80c8ea19217556179ffefc2296f78dba35e
