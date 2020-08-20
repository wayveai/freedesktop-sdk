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
  ref: v1.10.1-0-ga1f879b29c9aafe6a2bc0ba885701f8f4f19f772
