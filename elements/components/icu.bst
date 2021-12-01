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
  - "release-69-*"
  ref: release-69-1-0-g0e7b4428866f3133b4abba2d932ee3faa708db1d
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
