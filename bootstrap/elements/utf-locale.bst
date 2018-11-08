kind: manual

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: glibc-stage1.bst
  type: build

config:
  build-commands:
  - |
    mkdir -p glibc/lib/locale

  - |
    /glibc/bin/localedef --prefix=${PWD} --no-archive -i en_US -f UTF-8 en_US.UTF-8

  install-commands:
  - |
    mkdir -p "%{install-root}/%{indep-libdir}"

  - |
    mv glibc/lib/locale "%{install-root}/%{indep-libdir}"
