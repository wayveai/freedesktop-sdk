kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/tiffconf.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtiff.so'
        - '%{libdir}/libtiffxx.so'

  cpe:
    patches:
    - CVE-2018-12900
    - CVE-2019-6128
    - CVE-2019-7663 # Same fix as CVE-2018-12900
    - CVE-2019-14973

sources:
- kind: git_tag
  url: gitlab:libtiff/libtiff.git
  track: master
  ref: v4.0.10-0-gb8eac98dd0849c3f888518ce5cecc020f8b2991c
- kind: patch
  path: patches/libtiff/CVE-2019-6128.patch
- kind: patch
  path: patches/libtiff/CVE-2018-12900_CVE-2019-7663.patch
- kind: patch
  path: patches/libtiff/CVE-2019-14973.patch
