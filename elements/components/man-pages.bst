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
  ref: man-pages-5.04-0-g3bbd3971573072e25476e96bda7cd98bac974835
