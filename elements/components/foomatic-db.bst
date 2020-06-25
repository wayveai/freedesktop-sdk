kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/cups-daemon-only.bst

variables:
  builddir: ''

config:
  install-commands:
    (>):
    # Cups seems not like non ppd files
    - |
      find "%{install-root}%{datadir}/cups/model/foomatic-db-ppds" -not -type d -not -name "*.ppd" -not -name "*.ppd.*" -exec rm {} ";"

sources:
- kind: git_tag
  url: github:OpenPrinting/foomatic-db.git
  track: master
  track-tags: false
  ref: d62f3b9c31f639d4142b57fa93aaa2010be19921
