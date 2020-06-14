kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/libpng.bst
  type: build

variables:
  meson-local: >-
    -Dauto_features=auto

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpixman-1.so'

sources:
- kind: git_tag
  url: freedesktop:pixman/pixman.git
  track: master
  ref: pixman-0.40.0-0-g244383bf9f3493c014985de46876e40fd5db43f3
