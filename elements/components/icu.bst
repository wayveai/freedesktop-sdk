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
  track: main
  track-extra:
  - maint/maint-64
  exclude:
  - "release-*-rc"
  - "*-preview"
  - "*-alpha"
  - "*-beta"
  match:
  - "release-*"
  ref: release-70-1-0-ga56dde820dc35665a66f2e9ee8ba58e75049b668
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
