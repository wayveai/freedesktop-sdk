kind: autotools

build-depends:
- bootstrap/pcre2-build-deps.bst

runtime-depends:
- bootstrap/glibc.bst

(@):
- elements/bootstrap/include/target.yml

variables:
  common_options: "--enable-pcre2-16 --enable-pcre2-32"
  arch_options: ''
  (?):
  - (target_arch == "x86_64" or target_arch == "i686"):
      local_flags: -mshstk
  - target_arch != "riscv64":
      arch_options: "--enable-jit"

  conf-local: >-
    %{common_options}
    %{arch_options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pcre2-config'
        - '%{libdir}/libpcre2-8.so'
        - '%{libdir}/libpcre2-16.so'
        - '%{libdir}/libpcre2-32.so'
        - '%{libdir}/libpcre2-posix.so'

sources:
- kind: tar
  url: tar_https:ftp.pcre.org/pub/pcre/pcre2-10.35.tar.bz2
  ref: 9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613
