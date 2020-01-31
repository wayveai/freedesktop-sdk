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
  ref: v1.10.0-0-ged7f67040b370189d989adbd60ff8ea29957231f
