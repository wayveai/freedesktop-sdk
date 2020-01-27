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
  arch-options: ''
  (?):
  - target_arch == "x86_64":
      aom_target: x86_64
  - target_arch == "i686":
      aom_target: x86
  - target_arch == "arm":
      aom_target: arm
      arch-options: >-
        -DENABLE_NEON=NO
  - target_arch == "aarch64":
      aom_target: arm64
  - target_arch == "powerpc64le":
      aom_target: ppc

  cmake-local: >-
    -DAOM_TARGET_CPU="%{aom_target}"
    -DENABLE_DOCS=NO
    -DENABLE_NASM=YES
    -DBUILD_SHARED_LIBS=YES
    %{arch-options}

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
  track-extra:
  - av1-normative
  ref: v1.0.0-errata1-avif-0-g4eb1e7795b9700d532af38a2d9489458a8038233
