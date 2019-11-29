kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/texinfo.bst
  type: build
- filename: components/help2man.bst
  type: build
- filename: components/m4.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/tar.bst
  type: build
- filename: components/gzip.bst
  type: build

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
        - '%{libdir}/libfl.so'

sources:
- kind: tar
  url: github_files:westes/flex/files/981163/flex-2.6.4.tar.gz
  ref: e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995
- kind: patch
  path: patches/flex/flex-pie.patch
