kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-rust.bst
- components/rust.bst

depends:
- components/python3.bst
- components/python3-cffi.bst

sources:
- kind: git_tag
  url: github:pyca/cryptography.git
  track: main
  ref: 37.0.0-0-ge0f6f38433e3a1cb57509dec1bec9107cbbe827d
- kind: cargo
  url: crates:crates
  cargo-lock: src/rust/Cargo.lock
  ref:
  - name: Inflector
    version: 0.11.4
    sha: fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3
  - name: aliasable
    version: 0.1.3
    sha: 250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd
  - name: asn1
    version: 0.8.7
    sha: cfffb35195feaeffb071af0f7a643405667813dd8629c27cb0c310fb76654ab1
  - name: asn1_derive
    version: 0.8.7
    sha: bc894fa05f786b6481065514e6ff5e1838a3362f543f71f6e1a92ff27b051c25
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: base64
    version: 0.13.0
    sha: 904dfeac50f3cdaba28fc6f57fdcddb75f49ed61346676a78c4ffe55877802fd
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: chrono
    version: 0.4.19
    sha: 670ad68c9088c2a963aaa298cb369688cf3f9465ce5e2d4ca10e6e0098a1ce73
  - name: indoc
    version: 0.3.6
    sha: 47741a8bc60fb26eb8d6e0238bbb26d8575ff623fdc97b1a2c00c050b9684ed8
  - name: indoc-impl
    version: 0.3.6
    sha: ce046d161f000fffde5f432a0d034d0341dc152643b2598ed5bfce44c4f3a8f0
  - name: instant
    version: 0.1.12
    sha: 7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.124
    sha: 21a41fed9d98f27ab1c6d161da622a4fa35e8a54a8adc24bbf3ddd0ef70b0e50
  - name: lock_api
    version: 0.4.7
    sha: 327fa5b6a6940e4699ec49a9beae1ea4845c6bab9314e4f84ac68742139d8c53
  - name: num-integer
    version: 0.1.44
    sha: d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a8031bc2801db
  - name: num-traits
    version: 0.2.14
    sha: 9a64b1ec5cda2586e284722486d802acf1f7dbdc623e2bfc57e65ca1cd099290
  - name: once_cell
    version: 1.10.0
    sha: 87f3e037eac156d1775da914196f0f37741a274155e34a0b7e427c35d2a2ecb9
  - name: ouroboros
    version: 0.15.0
    sha: 9f31a3b678685b150cba82b702dcdc5e155893f63610cf388d30cd988d4ca2bf
  - name: ouroboros_macro
    version: 0.15.0
    sha: 084fd65d5dd8b3772edccb5ffd1e4b7eba43897ecd0f9401e330e8c542959408
  - name: parking_lot
    version: 0.11.2
    sha: 7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99
  - name: parking_lot_core
    version: 0.8.5
    sha: d76e8e1493bcac0d2766c42737f34458f1c8c50c0d23bcb24ea953affb273216
  - name: paste
    version: 0.1.18
    sha: 45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880
  - name: paste-impl
    version: 0.1.18
    sha: d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6
  - name: pem
    version: 1.0.2
    sha: e9a3b09a20e374558580a4914d3b7d89bd61b954a5a5e1dcbea98753addb1947
  - name: proc-macro-error
    version: 1.0.4
    sha: da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c
  - name: proc-macro-error-attr
    version: 1.0.4
    sha: a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869
  - name: proc-macro-hack
    version: 0.5.19
    sha: dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5
  - name: proc-macro2
    version: 1.0.37
    sha: ec757218438d5fda206afc041538b2f6d889286160d649a86a24d37e1235afd1
  - name: pyo3
    version: 0.15.2
    sha: d41d50a7271e08c7c8a54cd24af5d62f73ee3a6f6a314215281ebdec421d5752
  - name: pyo3-build-config
    version: 0.15.2
    sha: 779239fc40b8e18bc8416d3a37d280ca9b9fb04bda54b98037bb6748595c2410
  - name: pyo3-macros
    version: 0.15.2
    sha: 00b247e8c664be87998d8628e86f282c25066165f1f8dda66100c48202fdb93a
  - name: pyo3-macros-backend
    version: 0.15.2
    sha: 5a8c2812c412e00e641d99eeb79dd478317d981d938aa60325dfa7157b607095
  - name: quote
    version: 1.0.18
    sha: a1feb54ed693b93a84e14094943b84b7c4eae204c512b7ccb95ab0c66d278ad1
  - name: redox_syscall
    version: 0.2.13
    sha: 62f25bc4c7e55e0b0b7a1d43fb893f4fa1361d0abe38b9ce4f323c2adfe6ef42
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: smallvec
    version: 1.8.0
    sha: f2dd574626839106c320a323308629dcb1acfc96e32a8cba364ddc61ac23ee83
  - name: stable_deref_trait
    version: 1.2.0
    sha: a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3
  - name: syn
    version: 1.0.91
    sha: b683b2b825c8eef438b77c36a06dc262294da3d5a5813fac20da149241dcd44d
  - name: unicode-xid
    version: 0.2.2
    sha: 8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3
  - name: unindent
    version: 0.1.8
    sha: 514672a55d7380da379785a4d70ca8386c8883ff7eaae877be4d2081cebe73d8
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
