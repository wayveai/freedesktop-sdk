kind: cmake

depends:
- filename: base.bst
  type: build
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
  url: https://download.fcitx-im.org/fcitx/fcitx-4.2.9.5.tar.xz
  ref: 9479cef9b66e53df0e874637d55759ec08a195cb8790513e133135d8e49ad911
