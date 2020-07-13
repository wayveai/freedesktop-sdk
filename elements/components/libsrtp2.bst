kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

config:
  build-commands:
  - |
    %{make} -C '%{builddir}' shared_library
  install-commands:
  - |
    %{make-install} -C '%{builddir}'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsrtp2.so'

sources:
- kind: git_tag
  url: github:cisco/libsrtp.git
  track: master
  ref: v2-0-gd02d21111e379c297e93a9033d7b653135f732ee
- kind: patch
  path: patches/libsrtp2/fix-for-gcc10.patch
