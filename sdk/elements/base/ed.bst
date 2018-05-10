kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/texinfo.bst
    type: build

config:
  install-commands:
    (>):
      - |
        rm "%{install-root}%{infodir}/dir"

sources:
  - kind: tar
    url: https://ftp.gnu.org/gnu/ed/ed-1.14.2.tar.lz
    ref: f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db
