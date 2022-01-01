kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  url: pypi:94/64/3115548d41cb001378099cb4fc6a6889c64ef43ac1b0e68c9e80b55884fa/zipp-3.7.0.tar.gz
  sha256sum: 9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebceafb87d
