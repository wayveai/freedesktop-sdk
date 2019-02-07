kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build


variables:
  autogen: autoreconf -vif

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libwavpack.so'

  cpe:
    patches:
    - CVE-2018-6767
    - CVE-2018-7253
    - CVE-2018-7254
    - CVE-2018-10536
    - CVE-2018-10537 # same as CVE-2018-10536
    - CVE-2018-10538
    - CVE-2018-10539 # same as CVE-2018-10538
    - CVE-2018-10540 # same as CVE-2018-10538
    - CVE-2018-19840
    - CVE-2018-19841

sources:
- kind: git_tag
  url: github:dbry/WavPack.git
  track: master
  ref: 5.1.0-0-g9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2
- kind: patch
  path: patches/wavpack/CVE-2018-6767.patch
- kind: patch
  path: patches/wavpack/CVE-2018-7253.patch
- kind: patch
  path: patches/wavpack/CVE-2018-7254.patch
- kind: patch
  path: patches/wavpack/CVE-2018-10536.patch
- kind: patch
  path: patches/wavpack/CVE-2018-10538.patch
- kind: patch
  path: patches/wavpack/CVE-2018-19840.patch
- kind: patch
  path: patches/wavpack/CVE-2018-19841.patch
