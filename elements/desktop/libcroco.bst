kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/glib.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcroco-0.6.so'
  cpe:
    patches:
      - 'CVE-2017-7960'
      - 'CVE-2017-7961'

sources:
- kind: git_tag
  url: gnome:libcroco
  track: master
  ref: 0.6.12-4-g9ad72875e9f08e4c519ef63d44cdbd94aa9504f7
