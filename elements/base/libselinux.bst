kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/pcre2.bst
- filename: base/libsepol.bst

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
  url: github_files:SELinuxProject/selinux/releases/download/20180524/libselinux-2.8.tar.gz
  ref: 31db96ec7643ce10912b3c3f98506a08a9116dcfe151855fd349c3fda96187e1
