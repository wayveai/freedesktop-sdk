kind: autotools

depends:
- filename: bootstrap/procps-build-deps.bst
  type: build
- filename: bootstrap/ncurses.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

variables:
  # Behavior of malloc cannot be tested when cross-compiling so
  # ac_cv_func_malloc_0_nonull is set manually.
  conf-local: |
    --with-ncurses \
    ac_cv_func_malloc_0_nonnull=yes \
    ac_cv_func_realloc_0_nonnull=yes

  builddir: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libprocps.so'

sources:
- kind: git_tag
  url: gitlab:procps-ng/procps.git
  track: master
  exclude:
  - '*rc*'
  ref: v3.3.15-0-g7bb949bcba13c107fa0f45d2d0298b1ad6b6d6cc
