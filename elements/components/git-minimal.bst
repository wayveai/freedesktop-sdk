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
    (>):
    - |
      find "%{install-root}" -type f -name perllocal.pod -delete

(@):
- elements/include/git.yml
