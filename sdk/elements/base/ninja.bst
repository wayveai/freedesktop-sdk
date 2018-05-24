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
  - kind: tar
    url: https://github.com/ninja-build/ninja/archive/v1.8.2.tar.gz
    ref: 86b8700c3d0880c2b44c2ff67ce42774aaf8c28cbf57725cb881569288c1c6f4
