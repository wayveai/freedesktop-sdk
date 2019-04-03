kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-rpath

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libseccomp.so'
  cpe:
    version: '2.4.0'

sources:
- kind: git_tag
  url: github:seccomp/libseccomp/
  track: release-2.4
  ref: v2.4.0-0-g4d64011741375bb1a4ba7d71905ca37b97885083
- kind: patch
  path: patches/libseccomp/no-static.patch
