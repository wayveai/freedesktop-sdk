kind: autotools

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-autotools.bst

depends:
- components/glib.bst
- components/systemd.bst
- components/libgudev.bst

sources:
- kind: git_tag
  url: github:linuxwacom/libwacom.git
  track: master
  ref: libwacom-1.3-0-g08cb07e95350f77f9d9f4ce7cdf9cd4325f2ccb9
