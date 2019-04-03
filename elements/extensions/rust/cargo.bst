kind: manual

depends:
- filename: bootstrap-import.bst
  type: build
- filename: extensions/rust/cargo-stage1.bst
  type: build
- filename: extensions/rust/rust.bst
- filename: base/openssl.bst
- filename: base/buildsystem-cmake.bst
  type: build
- filename: base/perl.bst
  type: build

variables:
  prefix: /usr/lib/sdk/rust
  lib: lib
  debugdir: /usr/lib/debug

config:
  configure-commands:
  - |
    mkdir home
    cat <<EOF >home/config
    [source.crates-io]
    replace-with = "vendored-sources"
    [source.vendored-sources]
    directory = "${PWD}/crates"
    EOF

  build-commands:
  - |
    cd source
    cargo build --release

  install-commands:
  - |
    cd source
    cargo install --root "%{install-root}/%{prefix}" --path .

environment:
  CARGO_HOME: '%{build-root}/home'
  PATH: /usr/bin:%{bindir}

sources:
- kind: tar
  url: github:rust-lang/cargo/archive/0.34.0.tar.gz
  directory: source
  ref: 658eb7be37d0e1c1c1b7c6a828ff0dbaed1405b5176ce50d8145d47a0fd258f1

# The following is generated with script generate_cargo_dependencies.py
- kind: crate
  url: https://static.crates.io/crates/adler32/adler32-1.0.3.crate
  ref: 7e522997b529f05601e05166c07ed17789691f562762c7f3b987263d2dedee5c
- kind: crate
  url: https://static.crates.io/crates/aho-corasick/aho-corasick-0.6.10.crate
  ref: 81ce3d38065e618af2d7b77e10c5ad9a069859b4be3c2250f674af3840d9c8a5
- kind: crate
  url: https://static.crates.io/crates/ansi_term/ansi_term-0.11.0.crate
  ref: ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b
- kind: crate
  url: https://static.crates.io/crates/atty/atty-0.2.11.crate
  ref: 9a7d5b8723950951411ee34d271d99dddcc2035a16ab25310ea2c8cfd4369652
- kind: crate
  url: https://static.crates.io/crates/autocfg/autocfg-0.1.2.crate
  ref: a6d640bee2da49f60a4068a7fae53acde8982514ab7bae8b8cea9e88cbcfd799
- kind: crate
  url: https://static.crates.io/crates/backtrace/backtrace-0.3.14.crate
  ref: cd5a90e2b463010cd0e0ce9a11d4a9d5d58d9f41d4a6ba3dcaf9e68b466e88b4
- kind: crate
  url: https://static.crates.io/crates/backtrace-sys/backtrace-sys-0.1.28.crate
  ref: 797c830ac25ccc92a7f8a7b9862bde440715531514594a6154e3d4a54dd769b6
- kind: crate
  url: https://static.crates.io/crates/bit-set/bit-set-0.5.1.crate
  ref: e84c238982c4b1e1ee668d136c510c67a13465279c0cb367ea6baf6310620a80
- kind: crate
  url: https://static.crates.io/crates/bit-vec/bit-vec-0.5.1.crate
  ref: f59bbe95d4e52a6398ec21238d31577f2b28a9d86807f06ca59d191d8440d0bb
- kind: crate
  url: https://static.crates.io/crates/bitflags/bitflags-1.0.4.crate
  ref: 228047a76f468627ca71776ecdebd732a3423081fcf5125585bcd7c49886ce12
- kind: crate
  url: https://static.crates.io/crates/bufstream/bufstream-0.1.4.crate
  ref: 40e38929add23cdf8a366df9b0e088953150724bcbe5fc330b0d8eb3b328eec8
- kind: crate
  url: https://static.crates.io/crates/build_const/build_const-0.2.1.crate
  ref: 39092a32794787acd8525ee150305ff051b0aa6cc2abaf193924f5ab05425f39
- kind: crate
  url: https://static.crates.io/crates/byteorder/byteorder-1.3.1.crate
  ref: a019b10a2a7cdeb292db131fc8113e57ea2a908f6e7894b0c3c671893b65dbeb
- kind: crate
  url: https://static.crates.io/crates/bytesize/bytesize-1.0.0.crate
  ref: 716960a18f978640f25101b5cbf1c6f6b0d3192fab36a2d98ca96f0ecbe41010
- kind: crate
  url: https://static.crates.io/crates/cc/cc-1.0.31.crate
  ref: c9ce8bb087aacff865633f0bd5aeaed910fe2fe55b55f4739527f2e023a2e53d
- kind: crate
  url: https://static.crates.io/crates/cfg-if/cfg-if-0.1.7.crate
  ref: 11d43355396e872eefb45ce6342e4374ed7bc2b3a502d1b28e36d6e23c05d1f4
- kind: crate
  url: https://static.crates.io/crates/chrono/chrono-0.4.6.crate
  ref: 45912881121cb26fad7c38c17ba7daa18764771836b34fab7d3fbd93ed633878
- kind: crate
  url: https://static.crates.io/crates/clap/clap-2.32.0.crate
  ref: b957d88f4b6a63b9d70d5f454ac8011819c6efa7727858f458ab71c756ce2d3e
- kind: crate
  url: https://static.crates.io/crates/cloudabi/cloudabi-0.0.3.crate
  ref: ddfc5b9aa5d4507acaf872de71051dfd0e309860e88966e1051e462a077aac4f
- kind: crate
  url: https://static.crates.io/crates/commoncrypto/commoncrypto-0.2.0.crate
  ref: d056a8586ba25a1e4d61cb090900e495952c7886786fc55f909ab2f819b69007
- kind: crate
  url: https://static.crates.io/crates/commoncrypto-sys/commoncrypto-sys-0.2.0.crate
  ref: 1fed34f46747aa73dfaa578069fd8279d2818ade2b55f38f22a9401c7f4083e2
- kind: crate
  url: https://static.crates.io/crates/core-foundation/core-foundation-0.6.3.crate
  ref: 4e2640d6d0bf22e82bed1b73c6aef8d5dd31e5abe6666c57e6d45e2649f4f887
- kind: crate
  url: https://static.crates.io/crates/core-foundation-sys/core-foundation-sys-0.6.2.crate
  ref: e7ca8a5221364ef15ce201e8ed2f609fc312682a8f4e0e3d4aa5879764e0fa3b
- kind: crate
  url: https://static.crates.io/crates/crc/crc-1.8.1.crate
  ref: d663548de7f5cca343f1e0a48d14dcfb0e9eb4e079ec58883b7251539fa10aeb
- kind: crate
  url: https://static.crates.io/crates/crc32fast/crc32fast-1.2.0.crate
  ref: ba125de2af0df55319f41944744ad91c71113bf74a4646efff39afe1f6842db1
- kind: crate
  url: https://static.crates.io/crates/crossbeam-channel/crossbeam-channel-0.3.8.crate
  ref: 0f0ed1a4de2235cabda8558ff5840bffb97fcb64c97827f354a451307df5f72b
- kind: crate
  url: https://static.crates.io/crates/crossbeam-utils/crossbeam-utils-0.6.5.crate
  ref: f8306fcef4a7b563b76b7dd949ca48f52bc1141aa067d2ea09565f3e2652aa5c
- kind: crate
  url: https://static.crates.io/crates/crypto-hash/crypto-hash-0.3.3.crate
  ref: 20ff87d28defc77c9980a5b81cae1a33c791dd0ead8af0cee0833eb98c8305b9
- kind: crate
  url: https://static.crates.io/crates/curl/curl-0.4.20.crate
  ref: bed4741d1d4e1fc1ba6786c1313057c609259785cde2c45e34602acc45fd6ccc
- kind: crate
  url: https://static.crates.io/crates/curl-sys/curl-sys-0.4.17.crate
  ref: 7b8d8e51964f58c8053337fcef48e1c4608c7ee70c6f2e457674a97dda5a5828
- kind: crate
  url: https://static.crates.io/crates/env_logger/env_logger-0.6.1.crate
  ref: b61fa891024a945da30a9581546e8cfaf5602c7b3f4c137a2805cf388f92075a
- kind: crate
  url: https://static.crates.io/crates/failure/failure-0.1.5.crate
  ref: 795bd83d3abeb9220f257e597aa0080a508b27533824adf336529648f6abf7e2
- kind: crate
  url: https://static.crates.io/crates/failure_derive/failure_derive-0.1.5.crate
  ref: ea1063915fd7ef4309e222a5a07cf9c319fb9c7836b1f89b85458672dbb127e1
- kind: crate
  url: https://static.crates.io/crates/filetime/filetime-0.2.4.crate
  ref: a2df5c1a8c4be27e7707789dc42ae65976e60b394afd293d1419ab915833e646
- kind: crate
  url: https://static.crates.io/crates/flate2/flate2-1.0.7.crate
  ref: f87e68aa82b2de08a6e037f1385455759df6e445a8df5e005b4297191dbf18aa
- kind: crate
  url: https://static.crates.io/crates/fnv/fnv-1.0.6.crate
  ref: 2fad85553e09a6f881f739c29f0b00b0f01357c743266d478b68951ce23285f3
- kind: crate
  url: https://static.crates.io/crates/foreign-types/foreign-types-0.3.2.crate
  ref: f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1
- kind: crate
  url: https://static.crates.io/crates/foreign-types-shared/foreign-types-shared-0.1.1.crate
  ref: 00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b
- kind: crate
  url: https://static.crates.io/crates/fs2/fs2-0.4.3.crate
  ref: 9564fc758e15025b46aa6643b1b77d047d1a56a1aea6e01002ac0c7026876213
- kind: crate
  url: https://static.crates.io/crates/fuchsia-cprng/fuchsia-cprng-0.1.1.crate
  ref: a06f77d526c1a601b7c4cdd98f54b5eaabffc14d5f2f0296febdc7f357c6d3ba
- kind: crate
  url: https://static.crates.io/crates/fwdansi/fwdansi-1.0.1.crate
  ref: 34dd4c507af68d37ffef962063dfa1944ce0dd4d5b82043dbab1dabe088610c3
- kind: crate
  url: https://static.crates.io/crates/git2/git2-0.8.0.crate
  ref: c7339329bfa14a00223244311560d11f8f489b453fb90092af97f267a6090ab0
- kind: crate
  url: https://static.crates.io/crates/git2-curl/git2-curl-0.9.0.crate
  ref: d58551e903ed7e2d6fe3a2f3c7efa3a784ec29b19d0fbb035aaf0497c183fbdd
- kind: crate
  url: https://static.crates.io/crates/glob/glob-0.2.11.crate
  ref: 8be18de09a56b60ed0edf84bc9df007e30040691af7acd1c41874faac5895bfb
- kind: crate
  url: https://static.crates.io/crates/globset/globset-0.4.2.crate
  ref: 4743617a7464bbda3c8aec8558ff2f9429047e025771037df561d383337ff865
- kind: crate
  url: https://static.crates.io/crates/hex/hex-0.3.2.crate
  ref: 805026a5d0141ffc30abb3be3173848ad46a1b1664fe632428479619a3644d77
- kind: crate
  url: https://static.crates.io/crates/home/home-0.3.4.crate
  ref: 29302b90cfa76231a757a887d1e3153331a63c7f80b6c75f86366334cbe70708
- kind: crate
  url: https://static.crates.io/crates/humantime/humantime-1.2.0.crate
  ref: 3ca7e5f2e110db35f93b837c81797f3714500b81d517bf20c431b16d3ca4f114
- kind: crate
  url: https://static.crates.io/crates/idna/idna-0.1.5.crate
  ref: 38f09e0f0b1fb55fdee1f17470ad800da77af5186a1a76c026b679358b7e844e
- kind: crate
  url: https://static.crates.io/crates/ignore/ignore-0.4.6.crate
  ref: ad03ca67dc12474ecd91fdb94d758cbd20cb4e7a78ebe831df26a9b7511e1162
- kind: crate
  url: https://static.crates.io/crates/im-rc/im-rc-12.3.3.crate
  ref: 37d41003c2c8f39e5f43ca47fb9113b739eeb7744d645d0cd366861f08a7eff9
- kind: crate
  url: https://static.crates.io/crates/itoa/itoa-0.4.3.crate
  ref: 1306f3464951f30e30d12373d31c79fbd52d236e5e896fd92f96ec7babbbe60b
- kind: crate
  url: https://static.crates.io/crates/jobserver/jobserver-0.1.13.crate
  ref: b3d51e24009d966c8285d524dbaf6d60926636b2a89caee9ce0bd612494ddc16
- kind: crate
  url: https://static.crates.io/crates/kernel32-sys/kernel32-sys-0.2.2.crate
  ref: 7507624b29483431c0ba2d82aece8ca6cdba9382bff4ddd0f7490560c056098d
- kind: crate
  url: https://static.crates.io/crates/lazy_static/lazy_static-1.3.0.crate
  ref: bc5729f27f159ddd61f4df6228e827e86643d4d3e7c32183cb30a1c08f604a14
- kind: crate
  url: https://static.crates.io/crates/lazycell/lazycell-1.2.1.crate
  ref: b294d6fa9ee409a054354afc4352b0b9ef7ca222c69b8812cbea9e7d2bf3783f
- kind: crate
  url: https://static.crates.io/crates/libc/libc-0.2.50.crate
  ref: aab692d7759f5cd8c859e169db98ae5b52c924add2af5fbbca11d12fefb567c1
- kind: crate
  url: https://static.crates.io/crates/libgit2-sys/libgit2-sys-0.7.11.crate
  ref: 48441cb35dc255da8ae72825689a95368bf510659ae1ad55dc4aa88cb1789bf1
- kind: crate
  url: https://static.crates.io/crates/libnghttp2-sys/libnghttp2-sys-0.1.1.crate
  ref: d75d7966bda4730b722d1eab8e668df445368a24394bae9fc1e8dc0ab3dbe4f4
- kind: crate
  url: https://static.crates.io/crates/libssh2-sys/libssh2-sys-0.2.11.crate
  ref: 126a1f4078368b163bfdee65fbab072af08a1b374a5551b21e87ade27b1fbf9d
- kind: crate
  url: https://static.crates.io/crates/libz-sys/libz-sys-1.0.25.crate
  ref: 2eb5e43362e38e2bca2fd5f5134c4d4564a23a5c28e9b95411652021a8675ebe
- kind: crate
  url: https://static.crates.io/crates/log/log-0.4.6.crate
  ref: c84ec4b527950aa83a329754b01dbe3f58361d1c5efacd1f6d68c494d08a17c6
- kind: crate
  url: https://static.crates.io/crates/matches/matches-0.1.8.crate
  ref: 7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08
- kind: crate
  url: https://static.crates.io/crates/memchr/memchr-2.2.0.crate
  ref: 2efc7bc57c883d4a4d6e3246905283d8dae951bb3bd32f49d6ef297f546e1c39
- kind: crate
  url: https://static.crates.io/crates/miniz-sys/miniz-sys-0.1.11.crate
  ref: 0300eafb20369952951699b68243ab4334f4b10a88f411c221d444b36c40e649
- kind: crate
  url: https://static.crates.io/crates/miniz_oxide/miniz_oxide-0.2.1.crate
  ref: c468f2369f07d651a5d0bb2c9079f8488a66d5466efe42d0c5c6466edcb7f71e
- kind: crate
  url: https://static.crates.io/crates/miniz_oxide_c_api/miniz_oxide_c_api-0.2.1.crate
  ref: b7fe927a42e3807ef71defb191dc87d4e24479b221e67015fe38ae2b7b447bab
- kind: crate
  url: https://static.crates.io/crates/miow/miow-0.3.3.crate
  ref: 396aa0f2003d7df8395cb93e09871561ccc3e785f0acb369170e8cc74ddf9226
- kind: crate
  url: https://static.crates.io/crates/num-integer/num-integer-0.1.39.crate
  ref: e83d528d2677f0518c570baf2b7abdcf0cd2d248860b68507bdcb3e91d4c0cea
- kind: crate
  url: https://static.crates.io/crates/num-traits/num-traits-0.2.6.crate
  ref: 0b3a5d7cc97d6d30d8b9bc8fa19bf45349ffe46241e8816f50f62f6d6aaabee1
- kind: crate
  url: https://static.crates.io/crates/num_cpus/num_cpus-1.10.0.crate
  ref: 1a23f0ed30a54abaa0c7e83b1d2d87ada7c3c23078d1d87815af3e3b6385fbba
- kind: crate
  url: https://static.crates.io/crates/opener/opener-0.3.2.crate
  ref: 04b1d6b086d9b3009550f9b6f81b10ad9428cf14f404b8e1a3a06f6f012c8ec9
- kind: crate
  url: https://static.crates.io/crates/openssl/openssl-0.10.20.crate
  ref: 5a0d6b781aac4ac1bd6cafe2a2f0ad8c16ae8e1dd5184822a16c50139f8838d9
- kind: crate
  url: https://static.crates.io/crates/openssl-probe/openssl-probe-0.1.2.crate
  ref: 77af24da69f9d9341038eba93a073b1fdaaa1b788221b00a69bce9e762cb32de
- kind: crate
  url: https://static.crates.io/crates/openssl-src/openssl-src-111.2.1+1.1.1b.crate
  ref: a42e4a28c5a3da4b0df51795aee275b812164c43a690caa871bfa71bf0d52439
- kind: crate
  url: https://static.crates.io/crates/openssl-sys/openssl-sys-0.9.43.crate
  ref: 33c86834957dd5b915623e94f2f4ab2c70dd8f6b70679824155d5ae21dbd495d
- kind: crate
  url: https://static.crates.io/crates/percent-encoding/percent-encoding-1.0.1.crate
  ref: 31010dd2e1ac33d5b46a5b413495239882813e0369f8ed8a5e266f173602f831
- kind: crate
  url: https://static.crates.io/crates/pkg-config/pkg-config-0.3.14.crate
  ref: 676e8eb2b1b4c9043511a9b7bea0915320d7e502b0a079fb03f9635a5252b18c
- kind: crate
  url: https://static.crates.io/crates/pretty_env_logger/pretty_env_logger-0.3.0.crate
  ref: df8b3f4e0475def7d9c2e5de8e5a1306949849761e107b360d03e98eafaffd61
- kind: crate
  url: https://static.crates.io/crates/proc-macro2/proc-macro2-0.4.27.crate
  ref: 4d317f9caece796be1980837fd5cb3dfec5613ebdb04ad0956deea83ce168915
- kind: crate
  url: https://static.crates.io/crates/proptest/proptest-0.8.7.crate
  ref: 926d0604475349f463fe44130aae73f2294b5309ab2ca0310b998bd334ef191f
- kind: crate
  url: https://static.crates.io/crates/quick-error/quick-error-1.2.2.crate
  ref: 9274b940887ce9addde99c4eee6b5c44cc494b182b97e73dc8ffdcb3397fd3f0
- kind: crate
  url: https://static.crates.io/crates/quote/quote-0.6.11.crate
  ref: cdd8e04bd9c52e0342b406469d494fcb033be4bdbe5c606016defbb1681411e1
- kind: crate
  url: https://static.crates.io/crates/rand/rand-0.5.6.crate
  ref: c618c47cd3ebd209790115ab837de41425723956ad3ce2e6a7f09890947cacb9
- kind: crate
  url: https://static.crates.io/crates/rand/rand-0.6.5.crate
  ref: 6d71dacdc3c88c1fde3885a3be3fbab9f35724e6ce99467f7d9c5026132184ca
- kind: crate
  url: https://static.crates.io/crates/rand_chacha/rand_chacha-0.1.1.crate
  ref: 556d3a1ca6600bfcbab7c7c91ccb085ac7fbbcd70e008a98742e7847f4f7bcef
- kind: crate
  url: https://static.crates.io/crates/rand_core/rand_core-0.3.1.crate
  ref: 7a6fdeb83b075e8266dcc8762c22776f6877a63111121f5f8c7411e5be7eed4b
- kind: crate
  url: https://static.crates.io/crates/rand_core/rand_core-0.4.0.crate
  ref: d0e7a549d590831370895ab7ba4ea0c1b6b011d106b5ff2da6eee112615e6dc0
- kind: crate
  url: https://static.crates.io/crates/rand_hc/rand_hc-0.1.0.crate
  ref: 7b40677c7be09ae76218dc623efbf7b18e34bced3f38883af07bb75630a21bc4
- kind: crate
  url: https://static.crates.io/crates/rand_isaac/rand_isaac-0.1.1.crate
  ref: ded997c9d5f13925be2a6fd7e66bf1872597f759fd9dd93513dd7e92e5a5ee08
- kind: crate
  url: https://static.crates.io/crates/rand_jitter/rand_jitter-0.1.3.crate
  ref: 7b9ea758282efe12823e0d952ddb269d2e1897227e464919a554f2a03ef1b832
- kind: crate
  url: https://static.crates.io/crates/rand_os/rand_os-0.1.3.crate
  ref: 7b75f676a1e053fc562eafbb47838d67c84801e38fc1ba459e8f180deabd5071
- kind: crate
  url: https://static.crates.io/crates/rand_pcg/rand_pcg-0.1.2.crate
  ref: abf9b09b01790cfe0364f52bf32995ea3c39f4d2dd011eac241d2914146d0b44
- kind: crate
  url: https://static.crates.io/crates/rand_xorshift/rand_xorshift-0.1.1.crate
  ref: cbf7e9e623549b0e21f6e97cf8ecf247c1a8fd2e8a992ae265314300b2455d5c
- kind: crate
  url: https://static.crates.io/crates/rdrand/rdrand-0.4.0.crate
  ref: 678054eb77286b51581ba43620cc911abf02758c91f93f479767aed0f90458b2
- kind: crate
  url: https://static.crates.io/crates/redox_syscall/redox_syscall-0.1.51.crate
  ref: 423e376fffca3dfa06c9e9790a9ccd282fafb3cc6e6397d01dbf64f9bacc6b85
- kind: crate
  url: https://static.crates.io/crates/redox_termios/redox_termios-0.1.1.crate
  ref: 7e891cfe48e9100a70a3b6eb652fef28920c117d366339687bd5576160db0f76
- kind: crate
  url: https://static.crates.io/crates/regex/regex-1.1.2.crate
  ref: 53ee8cfdddb2e0291adfb9f13d31d3bbe0a03c9a402c01b1e24188d86c35b24f
- kind: crate
  url: https://static.crates.io/crates/regex-syntax/regex-syntax-0.6.5.crate
  ref: 8c2f35eedad5295fdf00a63d7d4b238135723f92b434ec06774dad15c7ab0861
- kind: crate
  url: https://static.crates.io/crates/remove_dir_all/remove_dir_all-0.5.1.crate
  ref: 3488ba1b9a2084d38645c4c08276a1752dcbf2c7130d74f1569681ad5d2799c5
- kind: crate
  url: https://static.crates.io/crates/rustc-demangle/rustc-demangle-0.1.13.crate
  ref: adacaae16d02b6ec37fdc7acfcddf365978de76d1983d3ee22afc260e1ca9619
- kind: crate
  url: https://static.crates.io/crates/rustc-workspace-hack/rustc-workspace-hack-1.0.0.crate
  ref: fc71d2faa173b74b232dedc235e3ee1696581bb132fc116fa3626d6151a1a8fb
- kind: crate
  url: https://static.crates.io/crates/rustc_version/rustc_version-0.2.3.crate
  ref: 138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a
- kind: crate
  url: https://static.crates.io/crates/rustfix/rustfix-0.4.4.crate
  ref: af7c21531a91512a4a51b490be6ba1c8eff34fdda0dc5bf87dc28d86748aac56
- kind: crate
  url: https://static.crates.io/crates/rusty-fork/rusty-fork-0.2.1.crate
  ref: 9591f190d2852720b679c21f66ad929f9f1d7bb09d1193c26167586029d8489c
- kind: crate
  url: https://static.crates.io/crates/ryu/ryu-0.2.7.crate
  ref: eb9e9b8cde282a9fe6a42dd4681319bfb63f121b8a8ee9439c6f4107e58a46f7
- kind: crate
  url: https://static.crates.io/crates/same-file/same-file-1.0.4.crate
  ref: 8f20c4be53a8a1ff4c1f1b2bd14570d2f634628709752f0702ecdd2b3f9a5267
- kind: crate
  url: https://static.crates.io/crates/schannel/schannel-0.1.15.crate
  ref: f2f6abf258d99c3c1c5c2131d99d064e94b7b3dd5f416483057f308fea253339
- kind: crate
  url: https://static.crates.io/crates/scopeguard/scopeguard-0.3.3.crate
  ref: 94258f53601af11e6a49f722422f6e3425c52b06245a5cf9bc09908b174f5e27
- kind: crate
  url: https://static.crates.io/crates/semver/semver-0.9.0.crate
  ref: 1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403
- kind: crate
  url: https://static.crates.io/crates/semver-parser/semver-parser-0.7.0.crate
  ref: 388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3
- kind: crate
  url: https://static.crates.io/crates/serde/serde-1.0.89.crate
  ref: 92514fb95f900c9b5126e32d020f5c6d40564c27a5ea6d1d7d9f157a96623560
- kind: crate
  url: https://static.crates.io/crates/serde_derive/serde_derive-1.0.89.crate
  ref: bb6eabf4b5914e88e24eea240bb7c9f9a2cbc1bbbe8d961d381975ec3c6b806c
- kind: crate
  url: https://static.crates.io/crates/serde_ignored/serde_ignored-0.0.4.crate
  ref: 190e9765dcedb56be63b6e0993a006c7e3b071a016a304736e4a315dc01fb142
- kind: crate
  url: https://static.crates.io/crates/serde_json/serde_json-1.0.39.crate
  ref: 5a23aa71d4a4d43fdbfaac00eff68ba8a06a51759a89ac3304323e800c4dd40d
- kind: crate
  url: https://static.crates.io/crates/shell-escape/shell-escape-0.1.4.crate
  ref: 170a13e64f2a51b77a45702ba77287f5c6829375b04a69cf2222acd17d0cfab9
- kind: crate
  url: https://static.crates.io/crates/sized-chunks/sized-chunks-0.1.2.crate
  ref: 882678bcc6f62ef6bb83ce1b7dbbec316f24a2be7f3033acc107d3b11735cb50
- kind: crate
  url: https://static.crates.io/crates/smallvec/smallvec-0.6.9.crate
  ref: c4488ae950c49d403731982257768f48fada354a5203fe81f9bb6f43ca9002be
- kind: crate
  url: https://static.crates.io/crates/socket2/socket2-0.3.8.crate
  ref: c4d11a52082057d87cb5caa31ad812f4504b97ab44732cd8359df2e9ff9f48e7
- kind: crate
  url: https://static.crates.io/crates/strsim/strsim-0.7.0.crate
  ref: bb4f380125926a99e52bc279241539c018323fab05ad6368b56f93d9369ff550
- kind: crate
  url: https://static.crates.io/crates/syn/syn-0.15.29.crate
  ref: 1825685f977249735d510a242a6727b46efe914bb67e38d30c071b1b72b1d5c2
- kind: crate
  url: https://static.crates.io/crates/synstructure/synstructure-0.10.1.crate
  ref: 73687139bf99285483c96ac0add482c3776528beac1d97d444f6e91f203a2015
- kind: crate
  url: https://static.crates.io/crates/tar/tar-0.4.22.crate
  ref: c2167ff53da2a661702b3299f71a91b61b1dffef36b4b2884b1f9c67254c0133
- kind: crate
  url: https://static.crates.io/crates/tempfile/tempfile-3.0.7.crate
  ref: b86c784c88d98c801132806dadd3819ed29d8600836c4088e855cdf3e178ed8a
- kind: crate
  url: https://static.crates.io/crates/termcolor/termcolor-1.0.4.crate
  ref: 4096add70612622289f2fdcdbd5086dc81c1e2675e6ae58d6c4f62a16c6d7f2f
- kind: crate
  url: https://static.crates.io/crates/termion/termion-1.5.1.crate
  ref: 689a3bdfaab439fd92bc87df5c4c78417d3cbe537487274e9b0b2dce76e92096
- kind: crate
  url: https://static.crates.io/crates/textwrap/textwrap-0.10.0.crate
  ref: 307686869c93e71f94da64286f9a9524c0f308a9e1c87a583de8e9c9039ad3f6
- kind: crate
  url: https://static.crates.io/crates/thread_local/thread_local-0.3.6.crate
  ref: c6b53e329000edc2b34dbe8545fd20e55a333362d0a321909685a19bd28c3f1b
- kind: crate
  url: https://static.crates.io/crates/time/time-0.1.42.crate
  ref: db8dcfca086c1143c9270ac42a2bbd8a7ee477b78ac8e45b19abfb0cbede4b6f
- kind: crate
  url: https://static.crates.io/crates/toml/toml-0.4.10.crate
  ref: 758664fc71a3a69038656bee8b6be6477d2a6c315a6b81f7081f591bffa4111f
- kind: crate
  url: https://static.crates.io/crates/typenum/typenum-1.10.0.crate
  ref: 612d636f949607bdf9b123b4a6f6d966dedf3ff669f7f045890d3a4a73948169
- kind: crate
  url: https://static.crates.io/crates/ucd-util/ucd-util-0.1.3.crate
  ref: 535c204ee4d8434478593480b8f86ab45ec9aae0e83c568ca81abf0fd0e88f86
- kind: crate
  url: https://static.crates.io/crates/unicode-bidi/unicode-bidi-0.3.4.crate
  ref: 49f2bd0c6468a8230e1db229cff8029217cf623c767ea5d60bfbd42729ea54d5
- kind: crate
  url: https://static.crates.io/crates/unicode-normalization/unicode-normalization-0.1.8.crate
  ref: 141339a08b982d942be2ca06ff8b076563cbe223d1befd5450716790d44e2426
- kind: crate
  url: https://static.crates.io/crates/unicode-width/unicode-width-0.1.5.crate
  ref: 882386231c45df4700b275c7ff55b6f3698780a650026380e72dabe76fa46526
- kind: crate
  url: https://static.crates.io/crates/unicode-xid/unicode-xid-0.1.0.crate
  ref: fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc
- kind: crate
  url: https://static.crates.io/crates/url/url-1.7.2.crate
  ref: dd4e7c0d531266369519a4aa4f399d748bd37043b00bde1e4ff1f60a120b355a
- kind: crate
  url: https://static.crates.io/crates/url_serde/url_serde-0.2.0.crate
  ref: 74e7d099f1ee52f823d4bdd60c93c3602043c728f5db3b97bdb548467f7bddea
- kind: crate
  url: https://static.crates.io/crates/utf8-ranges/utf8-ranges-1.0.2.crate
  ref: 796f7e48bef87609f7ade7e06495a87d5cd06c7866e6a5cbfceffc558a243737
- kind: crate
  url: https://static.crates.io/crates/vcpkg/vcpkg-0.2.6.crate
  ref: def296d3eb3b12371b2c7d0e83bfe1403e4db2d7a0bba324a12b21c4ee13143d
- kind: crate
  url: https://static.crates.io/crates/vec_map/vec_map-0.8.1.crate
  ref: 05c78687fb1a80548ae3250346c3db86a80a7cdd77bda190189f2d0a0987c81a
- kind: crate
  url: https://static.crates.io/crates/wait-timeout/wait-timeout-0.1.5.crate
  ref: b9f3bf741a801531993db6478b95682117471f76916f5e690dd8d45395b09349
- kind: crate
  url: https://static.crates.io/crates/walkdir/walkdir-2.2.7.crate
  ref: 9d9d7ed3431229a144296213105a390676cc49c9b6a72bd19f3176c98e129fa1
- kind: crate
  url: https://static.crates.io/crates/winapi/winapi-0.2.8.crate
  ref: 167dc9d6949a9b857f3451275e911c3f44255842c1f7a76f33c55103a909087a
- kind: crate
  url: https://static.crates.io/crates/winapi/winapi-0.3.6.crate
  ref: 92c1eb33641e276cfa214a0522acad57be5c56b10cb348b3c5117db75f3ac4b0
- kind: crate
  url: https://static.crates.io/crates/winapi-build/winapi-build-0.1.1.crate
  ref: 2d315eee3b34aca4797b2da6b13ed88266e6d612562a0c46390af8299fc699bc
- kind: crate
  url: https://static.crates.io/crates/winapi-i686-pc-windows-gnu/winapi-i686-pc-windows-gnu-0.4.0.crate
  ref: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
- kind: crate
  url: https://static.crates.io/crates/winapi-util/winapi-util-0.1.2.crate
  ref: 7168bab6e1daee33b4557efd0e95d5ca70a03706d39fa5f3fe7a236f584b03c9
- kind: crate
  url: https://static.crates.io/crates/winapi-x86_64-pc-windows-gnu/winapi-x86_64-pc-windows-gnu-0.4.0.crate
  ref: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
- kind: crate
  url: https://static.crates.io/crates/wincolor/wincolor-1.0.1.crate
  ref: 561ed901ae465d6185fa7864d63fbd5720d0ef718366c9a4dc83cf6170d7e9ba
