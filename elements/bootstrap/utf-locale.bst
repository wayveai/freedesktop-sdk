kind: manual

(@):
- elements/bootstrap/include/common.yml

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/build/glibc-stage1.bst
  type: build

config:
  build-commands:
  - |
    mkdir -p glibc/lib/locale

  - |
    /glibc/bin/localedef --prefix=${PWD} --no-archive -i en_US -f UTF-8 en_US.UTF-8
    /glibc/bin/localedef --prefix=${PWD} --no-archive -i C -f UTF-8 C.UTF-8

  install-commands:
  - |
    mkdir -p "%{install-root}/%{indep-libdir}"

  - |
    mv glibc/lib/locale "%{install-root}/%{indep-libdir}"
