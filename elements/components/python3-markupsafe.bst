kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

config:
  install-commands:
    (>):
    - find %{install-root} -name '*.c' -delete


sources:
- kind: tar
  url: pypi:e0/bf/acc45baeb2d7333ed724c30af188640d9cb0be4b28533edfc3e2ae5aad72/MarkupSafe-2.0.0a1.tar.gz
  ref: beac28ed60c8e838301226a7a85841d0af2068eba2dcb1a58c2d32d6c05e440e
