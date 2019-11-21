kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/git.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: base/which.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libpsl.so"

sources:
- kind: git_tag
  url: github:rockdaboot/libpsl.git
  track: master
  ref: libpsl-0.20.2-0-gb7f5c1414db2ead6f15737ab79fbc336a539ea16
  submodules:
    list:
      checkout: True
      url: github:publicsuffix/list.git
- kind: patch
  path: patches/libpsl/libpsl-Use-the-detected-PYTHON-version.patch
