kind: autotools

build-depends:
- bootstrap/debugedit-build-deps.bst

runtime-depends:
- bootstrap/elfutils.bst

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/debugedit-source.yml

variables:
  conf-local: >-
      ac_cv_func_malloc_0_nonnull=yes
      ac_cv_func_realloc_0_nonnull=yes

public:
  bst:
    split-rules:
      runtime: []
      devel:
      - /**
