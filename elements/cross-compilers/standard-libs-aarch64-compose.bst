kind: compose
depends:
- filename: bootstrap/glibc.bst
  junction: cross-compilers/freedesktop-sdk-aarch64.bst
  type: build

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/aarch64-linux-gnu/**"
        - "%{indep-libdir}/aarch64-linux-gnu/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
