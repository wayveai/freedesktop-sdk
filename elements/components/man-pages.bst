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
  ref: man-pages-5.02-0-g157de0be214a12253232569d62b42f3ccba6f878
