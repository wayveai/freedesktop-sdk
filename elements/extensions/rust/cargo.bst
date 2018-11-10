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
    cargo install --root "%{install-root}%{prefix}"

environment:
  CARGO_HOME: '%{build-root}/home'
  PATH: /usr/bin:%{bindir}

sources:
- kind: tar
  url: github:rust-lang/cargo/archive/0.31.1.tar.gz
  directory: source
  ref: d14462641610a56fd444200b02bb2547b663de3e63548990fba2e05435f4c096

# The following is generated with script generate_cargo_dependencies.py
- kind: crate
  url: https://static.crates.io/crates/adler32/adler32-1.0.3.crate
  ref: 7e522997b529f05601e05166c07ed17789691f562762c7f3b987263d2dedee5c
- kind: crate
  url: https://static.crates.io/crates/aho-corasick/aho-corasick-0.6.9.crate
  ref: 1e9a933f4e58658d7b12defcf96dc5c720f20832deebe3e0a19efd3b6aaeeb9e
- kind: crate
  url: https://static.crates.io/crates/ansi_term/ansi_term-0.11.0.crate
  ref: ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b
- kind: crate
  url: https://static.crates.io/crates/arrayvec/arrayvec-0.4.7.crate
  ref: a1e964f9e24d588183fcb43503abda40d288c8657dfc27311516ce2f05675aef
- kind: crate
  url: https://static.crates.io/crates/atty/atty-0.2.11.crate
  ref: 9a7d5b8723950951411ee34d271d99dddcc2035a16ab25310ea2c8cfd4369652
- kind: crate
  url: https://static.crates.io/crates/backtrace/backtrace-0.3.9.crate
  ref: 89a47830402e9981c5c41223151efcced65a0510c13097c769cede7efb34782a
- kind: crate
  url: https://static.crates.io/crates/backtrace-sys/backtrace-sys-0.1.24.crate
  ref: c66d56ac8dabd07f6aacdaf633f4b8262f5b3601a810a0dcddffd5c22c69daa0
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
  url: https://static.crates.io/crates/cc/cc-1.0.25.crate
  ref: f159dfd43363c4d08055a07703eb7a3406b0dac4d0584d96965a3262db3c9d16
- kind: crate
  url: https://static.crates.io/crates/cfg-if/cfg-if-0.1.6.crate
  ref: 082bb9b28e00d3c9d39cc03e64ce4cea0f1bb9b3fde493f0cbc008472d22bdf4
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
  url: https://static.crates.io/crates/crossbeam-channel/crossbeam-channel-0.2.6.crate
  ref: 7b85741761b7f160bc5e7e0c14986ef685b7f8bf9b7ad081c60c604bb4649827
- kind: crate
  url: https://static.crates.io/crates/crossbeam-epoch/crossbeam-epoch-0.6.1.crate
  ref: 2449aaa4ec7ef96e5fb24db16024b935df718e9ae1cec0a1e68feeca2efca7b8
- kind: crate
  url: https://static.crates.io/crates/crossbeam-utils/crossbeam-utils-0.5.0.crate
  ref: 677d453a17e8bd2b913fa38e8b9cf04bcdbb5be790aa294f2389661d72036015
- kind: crate
  url: https://static.crates.io/crates/crossbeam-utils/crossbeam-utils-0.6.0.crate
  ref: 6efda20eef4ccf2a862d442a1e0319d568f9133e16a085a1f8126fe9b6da852d
- kind: crate
  url: https://static.crates.io/crates/crypto-hash/crypto-hash-0.3.1.crate
  ref: 09de9ee0fc255ace04c7fa0763c9395a945c37c8292bb554f8d48361d1dcf1b4
- kind: crate
  url: https://static.crates.io/crates/curl/curl-0.4.19.crate
  ref: c7c9d851c825e0c033979d4516c9173bc19a78a96eb4d6ae51d4045440eafa16
- kind: crate
  url: https://static.crates.io/crates/curl-sys/curl-sys-0.4.15.crate
  ref: 721c204978be2143fab0a84b708c49d79d1f6100b8785610f456043a90708870
- kind: crate
  url: https://static.crates.io/crates/env_logger/env_logger-0.5.13.crate
  ref: 15b0a4d2e39f8420210be8b27eeda28029729e2fd4291019455016c348240c38
- kind: crate
  url: https://static.crates.io/crates/failure/failure-0.1.3.crate
  ref: 6dd377bcc1b1b7ce911967e3ec24fa19c3224394ec05b54aa7b083d498341ac7
- kind: crate
  url: https://static.crates.io/crates/failure_derive/failure_derive-0.1.3.crate
  ref: 64c2d913fe8ed3b6c6518eedf4538255b989945c14c2a7d5cbff62a5e2120596
- kind: crate
  url: https://static.crates.io/crates/filetime/filetime-0.2.2.crate
  ref: 6f57e64bf5eae62efd4efed005ae81a7115012a61f522bba54542e1a556af921
- kind: crate
  url: https://static.crates.io/crates/flate2/flate2-1.0.4.crate
  ref: 3b0c7353385f92079524de3b7116cf99d73947c08a7472774e9b3b04bff3b901
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
  url: https://static.crates.io/crates/fuchsia-zircon/fuchsia-zircon-0.3.3.crate
  ref: 2e9763c69ebaae630ba35f74888db465e49e259ba1bc0eda7d06f4a067615d82
- kind: crate
  url: https://static.crates.io/crates/fuchsia-zircon-sys/fuchsia-zircon-sys-0.3.3.crate
  ref: 3dcaa9ae7725d12cdb85b3ad99a434db70b468c09ded17e012d86b5c1010f7a7
- kind: crate
  url: https://static.crates.io/crates/fwdansi/fwdansi-1.0.1.crate
  ref: 34dd4c507af68d37ffef962063dfa1944ce0dd4d5b82043dbab1dabe088610c3
- kind: crate
  url: https://static.crates.io/crates/git2/git2-0.7.5.crate
  ref: 591f8be1674b421644b6c030969520bc3fa12114d2eb467471982ed3e9584e71
- kind: crate
  url: https://static.crates.io/crates/git2-curl/git2-curl-0.8.2.crate
  ref: 0173e317f8ba21f3fff0f71549fead5e42e67961dbd402bf69f42775f3cc78b4
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
  url: https://static.crates.io/crates/home/home-0.3.3.crate
  ref: 80dff82fb58cfbbc617fb9a9184b010be0529201553cda50ad04372bc2333aff
- kind: crate
  url: https://static.crates.io/crates/humantime/humantime-1.1.1.crate
  ref: 0484fda3e7007f2a4a0d9c3a703ca38c71c54c55602ce4660c419fd32e188c9e
- kind: crate
  url: https://static.crates.io/crates/idna/idna-0.1.5.crate
  ref: 38f09e0f0b1fb55fdee1f17470ad800da77af5186a1a76c026b679358b7e844e
- kind: crate
  url: https://static.crates.io/crates/ignore/ignore-0.4.4.crate
  ref: 36ecfc5ad80f0b1226df948c562e2cddd446096be3f644c95106400eae8a5e01
- kind: crate
  url: https://static.crates.io/crates/itoa/itoa-0.4.3.crate
  ref: 1306f3464951f30e30d12373d31c79fbd52d236e5e896fd92f96ec7babbbe60b
- kind: crate
  url: https://static.crates.io/crates/jobserver/jobserver-0.1.11.crate
  ref: 60af5f849e1981434e4a31d3d782c4774ae9b434ce55b101a96ecfd09147e8be
- kind: crate
  url: https://static.crates.io/crates/kernel32-sys/kernel32-sys-0.2.2.crate
  ref: 7507624b29483431c0ba2d82aece8ca6cdba9382bff4ddd0f7490560c056098d
- kind: crate
  url: https://static.crates.io/crates/lazy_static/lazy_static-1.2.0.crate
  ref: a374c89b9db55895453a74c1e38861d9deec0b01b405a82516e9d5de4820dea1
- kind: crate
  url: https://static.crates.io/crates/lazycell/lazycell-1.2.0.crate
  ref: ddba4c30a78328befecec92fc94970e53b3ae385827d28620f0f5bb2493081e0
- kind: crate
  url: https://static.crates.io/crates/libc/libc-0.2.43.crate
  ref: 76e3a3ef172f1a0b9a9ff0dd1491ae5e6c948b94479a3021819ba7d860c8645d
- kind: crate
  url: https://static.crates.io/crates/libgit2-sys/libgit2-sys-0.7.10.crate
  ref: 4916b5addc78ec36cc309acfcdf0b9f9d97ab7b84083118b248709c5b7029356
- kind: crate
  url: https://static.crates.io/crates/libssh2-sys/libssh2-sys-0.2.11.crate
  ref: 126a1f4078368b163bfdee65fbab072af08a1b374a5551b21e87ade27b1fbf9d
- kind: crate
  url: https://static.crates.io/crates/libz-sys/libz-sys-1.0.25.crate
  ref: 2eb5e43362e38e2bca2fd5f5134c4d4564a23a5c28e9b95411652021a8675ebe
- kind: crate
  url: https://static.crates.io/crates/lock_api/lock_api-0.1.4.crate
  ref: 775751a3e69bde4df9b38dd00a1b5d6ac13791e4223d4a0506577f0dd27cfb7a
- kind: crate
  url: https://static.crates.io/crates/log/log-0.4.6.crate
  ref: c84ec4b527950aa83a329754b01dbe3f58361d1c5efacd1f6d68c494d08a17c6
- kind: crate
  url: https://static.crates.io/crates/matches/matches-0.1.8.crate
  ref: 7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08
- kind: crate
  url: https://static.crates.io/crates/memchr/memchr-2.1.1.crate
  ref: 0a3eb002f0535929f1199681417029ebea04aadc0c7a4224b46be99c7f5d6a16
- kind: crate
  url: https://static.crates.io/crates/memoffset/memoffset-0.2.1.crate
  ref: 0f9dc261e2b62d7a622bf416ea3c5245cdd5d9a7fcc428c0d06804dfce1775b3
- kind: crate
  url: https://static.crates.io/crates/miniz-sys/miniz-sys-0.1.11.crate
  ref: 0300eafb20369952951699b68243ab4334f4b10a88f411c221d444b36c40e649
- kind: crate
  url: https://static.crates.io/crates/miniz_oxide/miniz_oxide-0.2.0.crate
  ref: 5ad30a47319c16cde58d0314f5d98202a80c9083b5f61178457403dfb14e509c
- kind: crate
  url: https://static.crates.io/crates/miniz_oxide_c_api/miniz_oxide_c_api-0.2.0.crate
  ref: 28edaef377517fd9fe3e085c37d892ce7acd1fbeab9239c5a36eec352d8a8b7e
- kind: crate
  url: https://static.crates.io/crates/miow/miow-0.3.3.crate
  ref: 396aa0f2003d7df8395cb93e09871561ccc3e785f0acb369170e8cc74ddf9226
- kind: crate
  url: https://static.crates.io/crates/nodrop/nodrop-0.1.12.crate
  ref: 9a2228dca57108069a5262f2ed8bd2e82496d2e074a06d1ccc7ce1687b6ae0a2
- kind: crate
  url: https://static.crates.io/crates/num_cpus/num_cpus-1.8.0.crate
  ref: c51a3322e4bca9d212ad9a158a02abc6934d005490c054a2778df73a70aa0a30
- kind: crate
  url: https://static.crates.io/crates/opener/opener-0.3.0.crate
  ref: 176cd8eadff5ef9fa5c6d19452535662c02c6bf29b3d594a3fc01f749bb24c94
- kind: crate
  url: https://static.crates.io/crates/openssl/openssl-0.10.15.crate
  ref: 5e1309181cdcbdb51bc3b6bedb33dfac2a83b3d585033d3f6d9e22e8c1928613
- kind: crate
  url: https://static.crates.io/crates/openssl-probe/openssl-probe-0.1.2.crate
  ref: 77af24da69f9d9341038eba93a073b1fdaaa1b788221b00a69bce9e762cb32de
- kind: crate
  url: https://static.crates.io/crates/openssl-src/openssl-src-111.0.1+1.1.1.crate
  ref: d1edaed888fd85a54a2646bf02992931ddefdda3b1a748fc79f088a8db27fcbe
- kind: crate
  url: https://static.crates.io/crates/openssl-sys/openssl-sys-0.9.39.crate
  ref: 278c1ad40a89aa1e741a1eed089a2f60b18fab8089c3139b542140fc7d674106
- kind: crate
  url: https://static.crates.io/crates/owning_ref/owning_ref-0.3.3.crate
  ref: cdf84f41639e037b484f93433aa3897863b561ed65c6e59c7073d7c561710f37
- kind: crate
  url: https://static.crates.io/crates/parking_lot/parking_lot-0.6.4.crate
  ref: f0802bff09003b291ba756dc7e79313e51cc31667e94afbe847def490424cde5
- kind: crate
  url: https://static.crates.io/crates/parking_lot_core/parking_lot_core-0.3.1.crate
  ref: ad7f7e6ebdc79edff6fdcb87a55b620174f7a989e3eb31b65231f4af57f00b8c
- kind: crate
  url: https://static.crates.io/crates/percent-encoding/percent-encoding-1.0.1.crate
  ref: 31010dd2e1ac33d5b46a5b413495239882813e0369f8ed8a5e266f173602f831
- kind: crate
  url: https://static.crates.io/crates/pkg-config/pkg-config-0.3.14.crate
  ref: 676e8eb2b1b4c9043511a9b7bea0915320d7e502b0a079fb03f9635a5252b18c
- kind: crate
  url: https://static.crates.io/crates/proc-macro2/proc-macro2-0.4.21.crate
  ref: ab2fc21ba78ac73e4ff6b3818ece00be4e175ffbef4d0a717d978b48b24150c4
- kind: crate
  url: https://static.crates.io/crates/quick-error/quick-error-1.2.2.crate
  ref: 9274b940887ce9addde99c4eee6b5c44cc494b182b97e73dc8ffdcb3397fd3f0
- kind: crate
  url: https://static.crates.io/crates/quote/quote-0.6.10.crate
  ref: 53fa22a1994bd0f9372d7a816207d8a2677ad0325b073f5c5332760f0fb62b5c
- kind: crate
  url: https://static.crates.io/crates/rand/rand-0.4.3.crate
  ref: 8356f47b32624fef5b3301c1be97e5944ecdd595409cc5da11d05f211db6cfbd
- kind: crate
  url: https://static.crates.io/crates/rand/rand-0.5.5.crate
  ref: e464cd887e869cddcae8792a4ee31d23c7edd516700695608f5b98c67ee0131c
- kind: crate
  url: https://static.crates.io/crates/rand_core/rand_core-0.2.2.crate
  ref: 1961a422c4d189dfb50ffa9320bf1f2a9bd54ecb92792fb9477f99a1045f3372
- kind: crate
  url: https://static.crates.io/crates/rand_core/rand_core-0.3.0.crate
  ref: 0905b6b7079ec73b314d4c748701f6931eb79fd97c668caa3f1899b22b32c6db
- kind: crate
  url: https://static.crates.io/crates/redox_syscall/redox_syscall-0.1.40.crate
  ref: c214e91d3ecf43e9a4e41e578973adeb14b474f2bee858742d127af75a0112b1
- kind: crate
  url: https://static.crates.io/crates/redox_termios/redox_termios-0.1.1.crate
  ref: 7e891cfe48e9100a70a3b6eb652fef28920c117d366339687bd5576160db0f76
- kind: crate
  url: https://static.crates.io/crates/regex/regex-1.0.6.crate
  ref: ee84f70c8c08744ea9641a731c7fadb475bf2ecc52d7f627feb833e0b3990467
- kind: crate
  url: https://static.crates.io/crates/regex-syntax/regex-syntax-0.6.3.crate
  ref: fbc557aac2b708fe84121caf261346cc2eed71978024337e42eb46b8a252ac6e
- kind: crate
  url: https://static.crates.io/crates/remove_dir_all/remove_dir_all-0.5.1.crate
  ref: 3488ba1b9a2084d38645c4c08276a1752dcbf2c7130d74f1569681ad5d2799c5
- kind: crate
  url: https://static.crates.io/crates/rustc-demangle/rustc-demangle-0.1.9.crate
  ref: bcfe5b13211b4d78e5c2cadfebd7769197d95c639c35a50057eb4c05de811395
- kind: crate
  url: https://static.crates.io/crates/rustc-workspace-hack/rustc-workspace-hack-1.0.0.crate
  ref: fc71d2faa173b74b232dedc235e3ee1696581bb132fc116fa3626d6151a1a8fb
- kind: crate
  url: https://static.crates.io/crates/rustc_version/rustc_version-0.2.3.crate
  ref: 138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a
- kind: crate
  url: https://static.crates.io/crates/rustfix/rustfix-0.4.2.crate
  ref: 756567f00f7d89c9f89a5c401b8b1caaa122e27240b9eaadd0bb52ee0b680b1b
- kind: crate
  url: https://static.crates.io/crates/ryu/ryu-0.2.7.crate
  ref: eb9e9b8cde282a9fe6a42dd4681319bfb63f121b8a8ee9439c6f4107e58a46f7
- kind: crate
  url: https://static.crates.io/crates/same-file/same-file-1.0.4.crate
  ref: 8f20c4be53a8a1ff4c1f1b2bd14570d2f634628709752f0702ecdd2b3f9a5267
- kind: crate
  url: https://static.crates.io/crates/schannel/schannel-0.1.14.crate
  ref: 0e1a231dc10abf6749cfa5d7767f25888d484201accbd919b66ab5413c502d56
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
  url: https://static.crates.io/crates/serde/serde-1.0.80.crate
  ref: 15c141fc7027dd265a47c090bf864cf62b42c4d228bbcf4e51a0c9e2b0d3f7ef
- kind: crate
  url: https://static.crates.io/crates/serde_derive/serde_derive-1.0.80.crate
  ref: 225de307c6302bec3898c51ca302fc94a7a1697ef0845fcee6448f33c032249c
- kind: crate
  url: https://static.crates.io/crates/serde_ignored/serde_ignored-0.0.4.crate
  ref: 190e9765dcedb56be63b6e0993a006c7e3b071a016a304736e4a315dc01fb142
- kind: crate
  url: https://static.crates.io/crates/serde_json/serde_json-1.0.33.crate
  ref: c37ccd6be3ed1fdf419ee848f7c758eb31b054d7cd3ae3600e3bae0adf569811
- kind: crate
  url: https://static.crates.io/crates/shell-escape/shell-escape-0.1.4.crate
  ref: 170a13e64f2a51b77a45702ba77287f5c6829375b04a69cf2222acd17d0cfab9
- kind: crate
  url: https://static.crates.io/crates/smallvec/smallvec-0.6.5.crate
  ref: 153ffa32fd170e9944f7e0838edf824a754ec4c1fc64746fcc9fe1f8fa602e5d
- kind: crate
  url: https://static.crates.io/crates/socket2/socket2-0.3.8.crate
  ref: c4d11a52082057d87cb5caa31ad812f4504b97ab44732cd8359df2e9ff9f48e7
- kind: crate
  url: https://static.crates.io/crates/stable_deref_trait/stable_deref_trait-1.1.1.crate
  ref: dba1a27d3efae4351c8051072d619e3ade2820635c3958d826bfea39d59b54c8
- kind: crate
  url: https://static.crates.io/crates/strsim/strsim-0.7.0.crate
  ref: bb4f380125926a99e52bc279241539c018323fab05ad6368b56f93d9369ff550
- kind: crate
  url: https://static.crates.io/crates/syn/syn-0.15.19.crate
  ref: 39054bb43f2c5e4f3aef47718a391bf397c1b820fefc86f467d4d354f67bf7ef
- kind: crate
  url: https://static.crates.io/crates/synstructure/synstructure-0.10.1.crate
  ref: 73687139bf99285483c96ac0add482c3776528beac1d97d444f6e91f203a2015
- kind: crate
  url: https://static.crates.io/crates/tar/tar-0.4.19.crate
  ref: 69e16840a1e0a1f1a880b739ef1cc6a4b85496c99b8aa786ccffce6e0c15624c
- kind: crate
  url: https://static.crates.io/crates/tempfile/tempfile-3.0.4.crate
  ref: 55c1195ef8513f3273d55ff59fe5da6940287a0d7a98331254397f464833675b
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
  url: https://static.crates.io/crates/toml/toml-0.4.8.crate
  ref: 4a2ecc31b0351ea18b3fe11274b8db6e4d82bce861bbb22e6dbed40417902c65
- kind: crate
  url: https://static.crates.io/crates/ucd-util/ucd-util-0.1.2.crate
  ref: d0f8bfa9ff0cadcd210129ad9d2c5f145c13e9ced3d3e5d948a6213487d52444
- kind: crate
  url: https://static.crates.io/crates/unicode-bidi/unicode-bidi-0.3.4.crate
  ref: 49f2bd0c6468a8230e1db229cff8029217cf623c767ea5d60bfbd42729ea54d5
- kind: crate
  url: https://static.crates.io/crates/unicode-normalization/unicode-normalization-0.1.7.crate
  ref: 6a0180bc61fc5a987082bfa111f4cc95c4caff7f9799f3e46df09163a937aa25
- kind: crate
  url: https://static.crates.io/crates/unicode-width/unicode-width-0.1.5.crate
  ref: 882386231c45df4700b275c7ff55b6f3698780a650026380e72dabe76fa46526
- kind: crate
  url: https://static.crates.io/crates/unicode-xid/unicode-xid-0.1.0.crate
  ref: fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc
- kind: crate
  url: https://static.crates.io/crates/unreachable/unreachable-1.0.0.crate
  ref: 382810877fe448991dfc7f0dd6e3ae5d58088fd0ea5e35189655f84e6814fa56
- kind: crate
  url: https://static.crates.io/crates/url/url-1.7.2.crate
  ref: dd4e7c0d531266369519a4aa4f399d748bd37043b00bde1e4ff1f60a120b355a
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
  url: https://static.crates.io/crates/version_check/version_check-0.1.5.crate
  ref: 914b1a6776c4c929a602fafd8bc742e06365d4bcbe48c30f9cca5824f70dc9dd
- kind: crate
  url: https://static.crates.io/crates/void/void-1.0.2.crate
  ref: 6a02e4885ed3bc0f2de90ea6dd45ebcbb66dacffe03547fadbb0eeae2770887d
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
  url: https://static.crates.io/crates/winapi-util/winapi-util-0.1.1.crate
  ref: afc5508759c5bf4285e61feb862b6083c8480aec864fa17a81fdec6f69b461ab
- kind: crate
  url: https://static.crates.io/crates/winapi-x86_64-pc-windows-gnu/winapi-x86_64-pc-windows-gnu-0.4.0.crate
  ref: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
- kind: crate
  url: https://static.crates.io/crates/wincolor/wincolor-1.0.1.crate
  ref: 561ed901ae465d6185fa7864d63fbd5720d0ef718366c9a4dc83cf6170d7e9ba
