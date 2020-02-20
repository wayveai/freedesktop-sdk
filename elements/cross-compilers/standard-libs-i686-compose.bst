kind: compose
depends:
- filename: bootstrap/glibc.bst
  junction: cross-compilers/freedesktop-sdk-i686.bst
  type: build

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/i386-linux-gnu/**"
        - "%{indep-libdir}/i386-linux-gnu/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
