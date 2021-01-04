kind: script

build-depends:
- tests/check-rpath-deps.bst
- platform-image.bst

config:
  commands:
  - |
    %{bindir}/find-rpath.py %{gcc_triplet} /sysroot

  layout:
    - element: tests/check-rpath-deps.bst
      destination: /
    - element: platform-image.bst
      destination: /sysroot
