kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/pcre2.bst
- filename: components/libsepol.bst

variables:
  builddir: ''

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'
  SBINDIR: '%{sbindir}'

config:
  configure-commands: []

  install-commands:
    (>):
    - |
      rm "%{install-root}/%{libdir}/libselinux.a"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libselinux.so'

sources:
- kind: tar
  url: github:SELinuxProject/selinux/releases/download/20180524/libselinux-2.8.tar.gz
  ref: 31db96ec7643ce10912b3c3f98506a08a9116dcfe151855fd349c3fda96187e1
