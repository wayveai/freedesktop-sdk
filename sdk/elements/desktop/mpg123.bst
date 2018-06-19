kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/pulseaudio.bst
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
      --with-default-audio=pulse \
      --with-audio=pulse

config:
  install-commands:
    (>):
      - |
        rm "%{install-root}%{bindir}"/*

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libout123.so"
          - "%{libdir}/libmpg123.so"

sources:
  - kind: tar
    url: https://mpg123.org/download/mpg123-1.25.7.tar.bz2
    ref: 31b15ebcf26111b874732e07c8e60de5053ee555eea15fb70c657a4f9f0344f3

