kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  common_options: "--enable-threads --enable-openmp"
  arch_options: ''
  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      arch_options: "--enable-sse2 --enable-avx"
  - target_arch == "aarch64":
      arch_options: "--enable-neon"
  - target_arch == "ppc64le":
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
  url: tar_http:www.fftw.org/fftw-3.3.9.tar.gz
  ref: bf2c7ce40b04ae811af714deb512510cc2c17b9ab9d6ddcf49fe4487eea7af3d
