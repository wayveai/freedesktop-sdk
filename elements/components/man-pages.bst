kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/man-pages-posix.bst

config:
  install-commands:
  - |
    make DESTDIR="%{install-root}" install

  - |
    # The following is provided by components/shadow.bst
    rm "%{install-root}%{mandir}/man3/getspnam.3"
    rm "%{install-root}%{mandir}/man5/passwd.5"

sources:
- kind: git_tag
  url: kernel:docs/man-pages/man-pages.git
  track: master
  track-extra:
  - man-pages-5.04
  ref: man-pages-5.11-0-ga291472957a8e724b8082d92b58d6fa7d151046b
