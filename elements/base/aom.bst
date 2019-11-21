kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build
- filename: base/nasm.bst
  type: build
- filename: base/git-minimal.bst
  type: build
- filename: base/perl.bst
  type: build

variables:
  (?):
  - target_arch == "x86_64":
      aom_target: x86_64
  - target_arch == "i686":
      aom_target: x86
  - target_arch == "arm":
      aom_target: arm
  - target_arch == "aarch64":
      aom_target: arm64

  cmake-local: >-
    -DAOM_TARGET_CPU="${aom_target}"
    -DENABLE_DOCS=NO
    -DENABLE_NASM=YES
    -DENABLE_NEON=NO
    -DBUILD_SHARED_LIBS=YES

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libaom.so"

sources:
- kind: git_tag
  url: aom:aom.git
  track: master
  ref: v1.0.0-0-gd14c5bb4f336ef1842046089849dee4a301fbbf0
- kind: patch
  path: patches/aom/0001-Add-support-for-GNUInstallDirs.patch
