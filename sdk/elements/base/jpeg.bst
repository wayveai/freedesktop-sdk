kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libjpeg.so"

sources:
  - kind: tar
    url: http://www.ijg.org/files/jpegsrc.v9b.tar.gz
    ref: 240fd398da741669bf3c90366f58452ea59041cacc741a489b99f2f6a0bad052

