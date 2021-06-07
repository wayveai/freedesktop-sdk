kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: git_https:git.gnunet.org/libmicrohttpd.git
  track: master
  exclude:
  - v0.9.71
  ref: v0.9.73-0-g7b93a775cdf7b292fe13838f1083605140fa6170
