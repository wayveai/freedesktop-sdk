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
  url: https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
  track: master
  ref: man-pages-5.01-0-g80e710925c75fe5955268ad6a9473615e140f47f
