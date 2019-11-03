kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: github:dosfstools/dosfstools.git
  track: master
  ref: v4.1-0-g820c2f90726db0468e0a684a5dc500fbde66466f

config:
  install-commands:
    (>):
    - ln -s %{prefix}/bin/mkfs.fat %{install-root}/%{prefix}/bin/mkdosfs
