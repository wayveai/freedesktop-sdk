kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/tar.bst

depends:
- bootstrap-import.bst

variables:
  # When build-dir is used with git, only configure logs land in
  # build-dir after running autogen
  build-dir: ''

environment:
  INSTALL_SYMLINKS: '1'

config:
  install-commands:
  - install -m 755 -D -t "%{install-root}%{bindir}" git

(@):
- elements/include/git.yml
