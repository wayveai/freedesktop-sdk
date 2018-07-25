kind: cmake

depends:
  - filename: bootstrap-import.bst
- filename: desktop/extra-cmake-modules.bst
  type: build
- filename: desktop/gtk3.bst

variables:
  cmake-local: |
    -DENABLE_QT=Off \
    -DENABLE_PINYIN=Off \
    -DENABLE_TABLE=Off \
    -DENABLE_GIR=Off \
    -DENABLE_GTK3_IM_MODULE=On \
    -DENABLE_OPENCC=Off \
    -DENABLE_CAIRO=Off \
    -DENABLE_SPELL=Off \
    -DENABLE_GTK2_IM_MODULE=Off \
    -DENABLE_LIBXML2=Off \
    -DENABLE_X11=Off \
    -DENABLE_ENCHANT=Off \
    -DENABLE_PRESAGE=Off

sources:
- kind: tar
  url: https://download.fcitx-im.org/fcitx/fcitx-4.2.9.6.tar.xz
  ref: d55eee3f094037b5c32f0c5397d585fdf932cbc7d2091ed6f78fd7a9ae512c47
