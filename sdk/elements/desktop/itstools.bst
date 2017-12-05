kind: myautotools

depends:
  - filename: base.bst
    type: build

variables:
  conf-extra:
    PYTHON="/usr/bin/python2"

sources:
  # itstool 2.0.4 crashes when building gtk-doc
  - kind: tar
    url: http://files.itstool.org/itstool/itstool-2.0.2.tar.bz2
    ref: bf909fb59b11a646681a8534d5700fec99be83bb2c57badf8c1844512227033a
