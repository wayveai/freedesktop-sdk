kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: public-stacks/buildsystem-autotools.bst
    type: build

variables:
  common_options: "--enable-threads --enable-openmp"
  arch_options: ''
  (?):
    - target_arch == "i686" or target_arch == "x86_64":
        arch_options: "--enable-sse2 --enable-avx"
    - target_arch == "aarch64":
        arch_options: "--enable-neon"
    - target_arch == "powerpc64le":
        arch_options: "--enable-vsx"
        # Remember to add --enable-altivec when we will build the single
        # precision libraries.

  conf-local: |
    %{common_options} \
    %{arch_options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfftw3.so'
        - '%{libdir}/libfftw3_omp.so'
        - '%{libdir}/libfftw3_threads.so'

sources:
  - kind: tar
    url: tar_http:www.fftw.org/fftw-3.3.8.tar.gz
    ref: 6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303
