kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libflac.bst
- filename: components/libogg.bst
- filename: components/libvorbis.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsndfile.so'
  cpe:
    product: libsndfile
    patches:
    - CVE-2017-12562
    - CVE-2017-14634
    - CVE-2017-6892
    - CVE-2017-8361
    - CVE-2017-8362
    - CVE-2017-8363
    - CVE-2017-8365 # Same fix as CVE-2017-8361
    - CVE-2017-14245 # Same fix as CVE-2018-19661
    - CVE-2017-14246 # Same fix as CVE-2018-19661
    - CVE-2017-17456 # Same fix as CVE-2018-19661
    - CVE-2017-17457 # Same fix as CVE-2018-19661
    - CVE-2018-13139
    - CVE-2018-19432 # Same fix as CVE-2018-13139
    - CVE-2018-19661
    - CVE-2018-19662 # Same fix as CVE-2018-19661
    - CVE-2018-19758
    - CVE-2019-3832

variables:
  conf-local: |
    --enable-external-libs

sources:
- kind: tar
  url: tar_http:www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz
  ref: 1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9
- kind: patch
  path: patches/sndfile/CVE-2017-12562.patch
- kind: patch
  path: patches/sndfile/CVE-2017-14634.patch
- kind: patch
  path: patches/sndfile/CVE-2017-6892.patch
- kind: patch
  path: patches/sndfile/CVE-2017-8361.patch
- kind: patch
  path: patches/sndfile/CVE-2017-8362.patch
- kind: patch
  path: patches/sndfile/CVE-2017-8363.patch
- kind: patch
  path: patches/sndfile/CVE-2018-13139.patch
- kind: patch
  path: patches/sndfile/CVE-2018-19661.patch
- kind: patch
  path: patches/sndfile/CVE-2018-19758.patch
- kind: patch
  path: patches/sndfile/CVE-2019-3832.patch
