kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/nasm.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjpeg.so'
        - '%{libdir}/libturbojpeg.so'

sources:
- kind: tar
  url: https://sourceforge.net/projects/libjpeg-turbo/files/1.5.3/libjpeg-turbo-1.5.3.tar.gz
  ref: b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523
