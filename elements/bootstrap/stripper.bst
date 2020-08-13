kind: manual

build-depends:
- bootstrap/stripper-build-deps.bst

runtime-depends:
- bootstrap/glibc.bst
- bootstrap/debugedit.bst
- bootstrap/dwz.bst
- bootstrap/xz.bst

(@): elements/bootstrap/include/target.yml

environment:
  CXX: "%{triplet}-g++"

config:
  build-commands:
  - |
    make

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" freedesktop-sdk-stripper

public:
  bst:
    split-rules:
      devel:
        (>):
        - "/**"

sources:
- kind: local
  path: files/stripper
