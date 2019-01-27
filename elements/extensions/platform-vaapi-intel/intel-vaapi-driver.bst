kind: autotools

depends:
- filename: desktop/libdrm.bst
- filename: desktop/libva.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    LIBVA_DRIVERS_PATH="%{libdir}/dri/intel-vaapi-driver"

sources:
- kind: git_tag
  url: github:intel/intel-vaapi-driver
  track: master
  ref: 2.2.0-0-g1eddac3e38658169dafd7c0767c2fa34de68d388
