kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/nasm.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/perl.bst
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
  - target_arch == "ppc64le":
      aom_target: ppc

  cmake-local: |
    -DAOM_TARGET_CPU="${aom_target}" \
    -DENABLE_DOCS=NO \
    -DENABLE_NASM=YES \
    -DENABLE_NEON=NO \
    -DBUILD_SHARED_LIBS=YES

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libaom.so"

sources:
- kind: git_tag
  url: git_https:aomedia.googlesource.com/aom.git
  track: master
  track-extra:
  - av1-normative
  ref: v1.0.0-errata1-0-gadd4b15580e410c00c927ee366fa65545045a5d9
- kind: patch
  path: patches/aom/0001-Add-support-for-GNUInstallDirs.patch
