kind: autotools

depends:
  - filename: desktop/libdrm.bst
  - filename: desktop/libva.bst
  - filename: base/pkg-config.bst
    type: build

variables:
  lib: lib    
  prefix: /app
  conf-local: |
    LIBVA_DRIVERS_PATH=/usr/lib/dri/intel-vaapi-driver

sources:
  - kind: tar
    url: https://github.com/intel/intel-vaapi-driver/releases/download/2.1.0/intel-vaapi-driver-2.1.0.tar.bz2
    ref: ecfaf2ccc4b9af7340e002d2ef807d1e33051d4992f1983f5f4d60e516f86bdf 
