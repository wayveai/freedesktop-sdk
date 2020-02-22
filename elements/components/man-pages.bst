kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/man-pages-posix.bst

config:
  install-commands:
  - |
    make DESTDIR="%{install-root}" install

sources:
- kind: git_tag
  url: kernel:docs/man-pages/man-pages.git
  track: master
  ref: man-pages-5.04-0-g3bbd3971573072e25476e96bda7cd98bac974835
