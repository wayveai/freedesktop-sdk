kind: autotools

depends:
- bootstrap-import.bst

sources:
- kind: tar
  url: https://github.com/dosfstools/dosfstools/releases/download/v4.1/dosfstools-4.1.tar.xz
  ref: e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173

config:
  install-commands:
    (>):
    - ln -s %{prefix}/bin/mkfs.fat %{install-root}/%{prefix}/bin/mkdosfs
