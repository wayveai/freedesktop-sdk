kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst
    type: build

sources:
  - kind: tar
    url: https://salsa.debian.org/iso-codes-team/iso-codes/uploads/ef8de8bc12e0512d26ed73436a477871/iso-codes-3.79.tar.xz
    ref: cbafd36cd4c588a254c0a5c42e682190c3784ceaf2a098da4c9c4a0cbc842822
