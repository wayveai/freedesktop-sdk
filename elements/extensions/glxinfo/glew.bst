kind: autotools

(@): elements/extensions/include/app.yml

build-depends:
- components/mesa-headers.bst

variables:
  make-args: >-
    GLEW_DEST="%{install-root}%{prefix}"
    GLEW_PREFIX="%{prefix}"
    LIBDIR="%{install-root}%{libdir}"
    CFLAGS.EXTRA="${CFLAGS} -fPIC"
    LDFLAGS.EXTRA="${LDFLAGS}"
    STRIP=""

config:
  configure-commands: []

  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make -j1 install %{make-args}

sources:
- kind: tar
  url: sourceforge:projects/glew/files/glew/2.2.0/glew-2.2.0.tgz
  ref: d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1
