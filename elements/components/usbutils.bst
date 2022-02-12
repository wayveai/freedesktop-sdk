kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libusb.bst

variables:
  autogen: |
    cd usbhid-dump
    ./bootstrap
    cd ..
    autoreconf --install --symlink

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/gregkh/usbutils.git
  track: master
  ref: v014-0-g57fb18e59cce31a50a1ca62d1e192512c905ba00
