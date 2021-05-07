kind: meson


build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst

depends:
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Duseroot=false

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 4755 "${sysroot}%{bindir}/fusermount3"

sources:
- kind: git_tag
  url: github:libfuse/libfuse.git
  track: master
  ref: fuse-3.10.3-0-gf6cb8f23ac80d067131af457994424d481d4da0e
