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
  - target_arch == "ppc64le":
      aom_target: ppc

  cmake-local: >-
    -DAOM_TARGET_CPU="%{aom_target}"
    -DENABLE_DOCS=NO
    -DENABLE_NASM=YES
    -DBUILD_SHARED_LIBS=YES
    %{arch-options}

config:
  install-commands:
    (>):
    - |
      rm '%{install-root}%{libdir}/libaom.a'

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
  # Tracking limited to v2 since v3 broke ABI
  match:
  - v2.*
  exclude:
  - '*rc*'
  ref: v2.0.2-0-gcb1d48da8da2061e72018761788a18b8fa8013bb
