kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      ../source/configure %{conf-args}

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libicu*.so"

sources:
  - kind: tar
    url: http://download.icu-project.org/files/icu4c/60.1/icu4c-60_1-src.tgz
    ref: f8f5a6c8fbf32c015a467972bdb1477dc5f5d5dfea908b6ed218715eeb5ee225
  - kind: patch
    path: elements/base/icu-fix-shared-linking.patch
