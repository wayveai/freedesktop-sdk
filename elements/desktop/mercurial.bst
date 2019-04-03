kind: make
description: Mercurial source control management

depends:
- filename: bootstrap-import.bst
- filename: base/python2.bst
- filename: base/python2-docutils.bst
  type: build

sources:
- kind: tar
  url: https://www.mercurial-scm.org/release/mercurial-4.6.2.tar.gz
  ref: 1cd04ea0200b3cfad7dfd8f149aca6ac8ac2209c423c27258cf4a1ded8e366af
