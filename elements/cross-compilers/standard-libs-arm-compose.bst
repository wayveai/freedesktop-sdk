kind: compose
depends:
- filename: bootstrap/glibc.bst
  junction: cross-compilers/freedesktop-sdk-arm.bst
  type: build

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/arm-linux-gnueabihf/**"
        - "%{indep-libdir}/arm-linux-gnueabihf/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
