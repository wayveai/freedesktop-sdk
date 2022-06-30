kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/gmp.bst

sources:
- kind: tar
  url: ftp_gnu_org:mpfr/mpfr-4.1.0.tar.xz
  ref: 0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f
  # https://www.mpfr.org/mpfr-4.1.0/allpatches - latest as of 30/06/2022
- kind: patch
  path: patches/mpfr/cumulative.patch
