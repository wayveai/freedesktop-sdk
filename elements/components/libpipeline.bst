kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gdbm.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipeline.so'

variables:
  autogen: ./bootstrap --no-git --gnulib-srcdir=gnulib-src

sources:
- kind: git_tag
  url: savannah:libpipeline.git
  track: master
  ref: 1.5.3-0-g5498dd55393e778beb6fd3b59bba297e683ce8db
- kind: git_tag
  url: savannah:gnulib.git
  # Track the exact commit from variable GNULIB_REVISION in bootstrap.conf
  track: 34881aff4043847f2640d90cf9aa325cc3ad08d6
  track-tags: false
  directory: gnulib-src
  ref: v0.1-2382-g34881aff4043847f2640d90cf9aa325cc3ad08d6
