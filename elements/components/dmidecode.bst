kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    sbindir="%{sbindir}"
    mandir="%{mandir}"
  make: make %{make-args}
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install

sources:
- kind: git_tag
  url: savannah:dmidecode.git
  track: master
  ref: dmidecode-3-3-0-g2ae62191236cf037f27668457de065d577cde265
