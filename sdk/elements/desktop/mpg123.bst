kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/pulseaudio.bst

variables:
  conf-extra: |
      --with-default-audio=pulse \
      --with-audio=pulse

sources:
  - kind: tar
    url: http://mpg123.org/download/mpg123-1.25.7.tar.bz2
    ref: 31b15ebcf26111b874732e07c8e60de5053ee555eea15fb70c657a4f9f0344f3

