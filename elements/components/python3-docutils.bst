kind: pip

depends:
- filename: components/python3.bst

build-depends:
- filename: bootstrap-import.bst
- filename: components/python3-pip.bst

config:
  install-commands:
    (>):
    - |
      for f in "%{install-root}%{bindir}/"*.py; do
        ln -s "$(basename "${f}")" "%{install-root}%{bindir}/$(basename "${f}" .py)"
      done

sources:
- kind: tar
  url: tar_https:files.pythonhosted.org/packages/2f/e0/3d435b34abd2d62e8206171892f174b180cd37b09d57b924ca5c2ef2219d/docutils-0.16.tar.gz
  ref: c2de3a60e9e7d07be26b7f2b00ca0309c207e06c100f9cc2a94931fc75a478fc
