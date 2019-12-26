kind: script

build-depends:
- tests/check-static-libraries-deps.bst
- sdk-image.bst

config:
  commands:
  - |
    python3 %{bindir}/check-static-libraries.py /sysroot %{datadir}/static_libraries_allow_list

  layout:
    - element: tests/check-static-libraries-deps.bst
      destination: /
    - element: sdk-image.bst
      destination: /sysroot
