kind: script

build-depends:
- components/systemd-stage1.bst

config:
  commands:
  - systemd-hwdb --usr --root %{install-root} update
