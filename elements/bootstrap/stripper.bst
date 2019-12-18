kind: manual

depends:
- filename: bootstrap/stripper-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime
- filename: bootstrap/debugedit.bst
  type: runtime
- filename: bootstrap/dwz.bst
  type: runtime

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
