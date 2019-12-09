kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

- filename: components/python3-dbus.bst
  type: runtime

sources:
- kind: git_tag
  url: github:martinpitt/python-dbusmock.git
  track: master
  ref: 0.18.3-0-g2b031b920a3ddf4cab843cf7763c8e12bd98e0ac
