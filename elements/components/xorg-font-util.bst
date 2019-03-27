kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: tar
  url: https://www.x.org/archive/individual/font/font-util-1.3.1.tar.gz
  ref: 34ebb0c9c14e0a392cdd5ea055c92489ad88d55ae148b2f1cfded0f3f63f2b5b
