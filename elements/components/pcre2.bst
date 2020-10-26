kind: autotools
description: pcre2

depends:
- filename: bootstrap-import.bst

variables:
  (?):
  - (target_arch == "x86_64" or target_arch == "i686"):
      local_flags: -mshstk
  - target_arch != "riscv64":
      conf_local: '--enable-jit'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pcre2-config'
        - '%{libdir}/libpcre2-8.so'
        - '%{libdir}/libpcre2-posix.so'

sources:
- kind: tar
  url: tar_https:ftp.pcre.org/pub/pcre/pcre2-10.35.tar.bz2
  ref: 9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613
