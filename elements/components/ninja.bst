kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst

config:
  build-commands:
  - |
    python3 ./configure.py --bootstrap

  install-commands:
  - |
    install -D -m 0755 ninja %{install-root}%{bindir}/ninja

sources:
- kind: git_tag
  url: github:ninja-build/ninja.git
  track: release
  ref: v1.10.2-0-ge72d1d581c945c158ed68d9bc48911063022a2c6
