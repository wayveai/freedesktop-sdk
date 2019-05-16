kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-proto-xorgproto.bst

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libfontenc-1.1.4.tar.gz
  ref: 895ee0986b32fbfcda7f4f25ef6cbacfa760e1690bf59f02085ce0e7d1eebb41
