# This is temporary. We need to report to snap missing apparmor rule
# to read libhistory.so required by bash. Until then, we have a simple
# shell for /bin/sh.
kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: kernel:utils/dash/dash.git
  track: master
  ref: v0.5.10.2-0-g0e6a3d20816365821fa9ff8f8c6d7bdf915ee3c8
