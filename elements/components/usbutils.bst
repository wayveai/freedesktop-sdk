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
  ref: v012-0-gf3a05e2e368cf17f9882c8d358f2fa205eb1ead6
