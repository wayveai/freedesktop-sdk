kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

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
  track: v1.6-stable
  ref: v1.6.1-0-gfd99d85cd13466c58a138bfe58ab0b039076a291
