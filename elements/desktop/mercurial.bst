kind: make
description: Mercurial source control management

depends:
- filename: bootstrap-import.bst
- filename: base/python2.bst
- filename: base/python2-docutils.bst
  type: build

sources:
- kind: tar
  url: tar_https:www.mercurial-scm.org/release/mercurial-4.9.1.tar.gz
  ref: 1bdd21bb87d1e05fb5cd395d488d0e0cc2f2f90ce0fd248e31a03595da5ccb47
