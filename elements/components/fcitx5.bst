kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/extra-cmake-modules.bst
  type: build
- filename: components/gtk3.bst

variables:
  cmake-local: |
    -DENABLE_GTK3_IM_MODULE=On \
    -DENABLE_GTK2_IM_MODULE=Off \
    -DENABLE_GIR=Off \
    -DENABLE_GTK4_IM_MODULE=Off

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libFcitx5GClient.so'

sources:
- kind: git_tag
  url: github:fcitx/fcitx5-gtk.git
  track: master
  ref: 5.0.14-0-g6173e6ed1e95142d4daf2f042cbc3f7eb000c967
