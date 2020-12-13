kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd "%{builddir}"
    ../icu4c/source/configure %{conf-args}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/icu-config'
        - '%{libdir}/libicudata.so'
        - '%{libdir}/libicui18n.so'
        - '%{libdir}/libicuio.so'
        - '%{libdir}/libicutest.so'
        - '%{libdir}/libicutu.so'
        - '%{libdir}/libicuuc.so'
        - '%{libdir}/icu'
        - '%{libdir}/icu/**'

  cpe:
    version-match: '(\d+)-(\d+)'
    product: international_components_for_unicode

sources:
- kind: git_tag
  url: github:unicode-org/icu.git
  use-lfs: false
  track: master
  track-extra:
  - maint/maint-64
  exclude:
  - "release-*-rc"
  - "*-preview"
  - "*-alpha"
  - "*-beta"
  ref: release-68-1-0-g5d81f6f9a0edc47892a1d2af7024f835b47deb82
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
