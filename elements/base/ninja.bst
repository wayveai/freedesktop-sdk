kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst

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
  track: master
  ref: v1.9.0-0-gb25c08bda4949192c69cea4cee057887341a2ffc
