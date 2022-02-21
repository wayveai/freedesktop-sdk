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
        - '%{bindir}/xslt-config'
        - '%{libdir}/libxslt.so'
        - '%{libdir}/libexslt.so'
        - '%{libdir}/xsltConf.sh'

  cpe:
    patches:
    - CVE-2019-11068
    - CVE-2019-13117
    - CVE-2019-13118

sources:
- kind: git_tag
  url: gnome:libxslt.git
  track: master
  ref: v1.1.35-0-g50af4e65da712ceb59f98a7feeeab2ddc3324ab9
