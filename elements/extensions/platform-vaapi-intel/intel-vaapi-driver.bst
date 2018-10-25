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
- kind: tar
  url: https://github.com/intel/intel-vaapi-driver/releases/download/2.2.0/intel-vaapi-driver-2.2.0.tar.bz2
  ref: e8a5f54694eb76aad42653b591030b8a53b1513144c09a80defb3d8d8c875c18
