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
  ref: v1.8.2-0-g253e94c1fa511704baeb61cf69995bbf09ba435e
