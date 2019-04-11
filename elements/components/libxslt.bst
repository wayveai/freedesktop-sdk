kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libxml2.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/libxslt"
      mv "%{install-root}%{includedir}/libxslt/xsltconfig.h" "%{install-root}%{includedir}/%{gcc_triplet}/libxslt/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxslt.so'
        - '%{libdir}/libexslt.so'
  cpe:
    version: '1.1.33'

sources:
- kind: git_tag
  url: gnome:libxslt
  track: master
  ref: v1.1.33-0-gf1eb717f04d9cc297cc5e58e94b81ac96f47e741
