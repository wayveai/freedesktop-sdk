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
  ref: dmidecode-3-2-0-ga448baafcc273baedd51c85dbe4d865dfe1a5add
