kind: autotools

variables:
  local_flags: -fcommon

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/libunwind.h" "%{install-root}%{includedir}/%{gcc_triplet}/"
      for h in "%{install-root}%{includedir}/"libunwind-{x86,arm,aarch64,x86_64}.h; do
        if [ -e "${h}" ]; then
           mv "${h}" "%{install-root}%{includedir}/%{gcc_triplet}/"
        fi
      done

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunwind*.so'

sources:
- kind: git_tag
  url: savannah:libunwind.git
  track: v1.3-stable
  ref: v1.3.1-0-g94aa304960927c130ecb5f664a642b32d9850688
- kind: patch
  path: patches/libunwind/libunwind-no-ppc64-libdir-hack.patch
