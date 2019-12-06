kind: autotools

depends:
- filename: bootstrap/procps-build-deps.bst
  type: build
- filename: bootstrap/ncurses.bst
  type: runtime

(@): elements/bootstrap/target.yml

variables:
  # Behavior of malloc cannot be tested when cross-compiling so
  # ac_cv_func_malloc_0_nonull is set manually.
  conf-local: |
    --with-ncurses \
    ac_cv_func_malloc_0_nonnull=yes \
    ac_cv_func_realloc_0_nonnull=yes

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libprocps.so'

sources:
- kind: tar
  url: tar_https:download.sourceforge.net/procps-ng/procps-ng-3.3.12.tar.xz
  ref: 6ed65ab86318f37904e8f9014415a098bec5bc53653e5d9ab404f95ca5e1a7d4
