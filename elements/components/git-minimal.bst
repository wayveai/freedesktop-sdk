kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/tar.bst

depends:
- bootstrap-import.bst

environment:
  INSTALL_SYMLINKS: '1'

variables:
  builddir: ''

config:
  install-commands:
  - install -m 755 -D -t "%{install-root}%{bindir}" git

(@):
- elements/include/git.yml
