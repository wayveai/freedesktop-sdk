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
  url: https://github.com/rust-lang/cargo/archive/0.30.0.tar.gz
  directory: source
  ref: 82f3ba49192b74b115b8aeca9db24deca022ee5e6351292611ab5b50e4455251

  # The following is generated with script generate_cargo_dependencies.py
- kind: crate
  url: https://static.crates.io/crates/aho-corasick/aho-corasick-0.6.6.crate
  ref: c1c6d463cbe7ed28720b5b489e7c083eeb8f90d08be2a0d6bb9e1ffea9ce1afa
- kind: crate
  url: https://static.crates.io/crates/ansi_term/ansi_term-0.11.0.crate
  ref: ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b
- kind: crate
  url: https://static.crates.io/crates/atty/atty-0.2.11.crate
  ref: 9a7d5b8723950951411ee34d271d99dddcc2035a16ab25310ea2c8cfd4369652
- kind: crate
  url: https://static.crates.io/crates/backtrace/backtrace-0.3.9.crate
  ref: 89a47830402e9981c5c41223151efcced65a0510c13097c769cede7efb34782a
- kind: crate
  url: https://static.crates.io/crates/backtrace-sys/backtrace-sys-0.1.23.crate
  ref: bff67d0c06556c0b8e6b5f090f0eac52d950d9dfd1d35ba04e4ca3543eaf6a7e
- kind: crate
  url: https://static.crates.io/crates/bitflags/bitflags-1.0.3.crate
  ref: d0c54bb8f454c567f21197eefcdbf5679d0bd99f2ddbe52e84c77061952e6789
- kind: crate
  url: https://static.crates.io/crates/bufstream/bufstream-0.1.3.crate
  ref: f2f382711e76b9de6c744cc00d0497baba02fb00a787f088c879f01d09468e32
- kind: crate
  url: https://static.crates.io/crates/cc/cc-1.0.18.crate
  ref: 2119ea4867bd2b8ed3aecab467709720b2d55b1bcfe09f772fd68066eaf15275
- kind: crate
  url: https://static.crates.io/crates/cfg-if/cfg-if-0.1.4.crate
  ref: efe5c877e17a9c717a0bf3613b2709f723202c4e4675cc8f12926ded29bcb17e
- kind: crate
  url: https://static.crates.io/crates/clap/clap-2.32.0.crate
  ref: b957d88f4b6a63b9d70d5f454ac8011819c6efa7727858f458ab71c756ce2d3e
- kind: crate
  url: https://static.crates.io/crates/cloudabi/cloudabi-0.0.3.crate
  ref: ddfc5b9aa5d4507acaf872de71051dfd0e309860e88966e1051e462a077aac4f
- kind: crate
  url: https://static.crates.io/crates/cmake/cmake-0.1.31.crate
  ref: 95470235c31c726d72bf2e1f421adc1e65b9d561bf5529612cbe1a72da1467b3
- kind: crate
  url: https://static.crates.io/crates/commoncrypto/commoncrypto-0.2.0.crate
  ref: d056a8586ba25a1e4d61cb090900e495952c7886786fc55f909ab2f819b69007
- kind: crate
  url: https://static.crates.io/crates/commoncrypto-sys/commoncrypto-sys-0.2.0.crate
  ref: 1fed34f46747aa73dfaa578069fd8279d2818ade2b55f38f22a9401c7f4083e2
- kind: crate
  url: https://static.crates.io/crates/core-foundation/core-foundation-0.6.1.crate
  ref: cc3532ec724375c7cb7ff0a097b714fde180bb1f6ed2ab27cfcd99ffca873cd2
- kind: crate
  url: https://static.crates.io/crates/core-foundation-sys/core-foundation-sys-0.6.1.crate
  ref: a3fb15cdbdd9cf8b82d97d0296bb5cd3631bba58d6e31650a002a8e7fb5721f9
- kind: crate
  url: https://static.crates.io/crates/crossbeam/crossbeam-0.3.2.crate
  ref: 24ce9782d4d5c53674646a6a4c1863a21a8fc0cb649b3c94dfc16e45071dea19
- kind: crate
  url: https://static.crates.io/crates/crossbeam-utils/crossbeam-utils-0.5.0.crate
  ref: 677d453a17e8bd2b913fa38e8b9cf04bcdbb5be790aa294f2389661d72036015
- kind: crate
  url: https://static.crates.io/crates/crypto-hash/crypto-hash-0.3.1.crate
  ref: 09de9ee0fc255ace04c7fa0763c9395a945c37c8292bb554f8d48361d1dcf1b4
- kind: crate
  url: https://static.crates.io/crates/curl/curl-0.4.14.crate
  ref: 444c2f9e71458b34e75471ed8d756947a0bb920b8b8b9bfc56dfcc4fc6819a13
- kind: crate
  url: https://static.crates.io/crates/curl-sys/curl-sys-0.4.8.crate
  ref: 981bd902fcd8b8b999cf71b81447e27d66c3493a7f62f1372866fd32986c0c82
- kind: crate
  url: https://static.crates.io/crates/dtoa/dtoa-0.4.3.crate
  ref: 6d301140eb411af13d3115f9a562c85cc6b541ade9dfa314132244aaee7489dd
- kind: crate
  url: https://static.crates.io/crates/env_logger/env_logger-0.5.11.crate
  ref: 7873e292d20e8778f951278972596b3df36ac72a65c5b406f6d4961070a870c1
- kind: crate
  url: https://static.crates.io/crates/failure/failure-0.1.2.crate
  ref: 7efb22686e4a466b1ec1a15c2898f91fa9cb340452496dca654032de20ff95b9
- kind: crate
  url: https://static.crates.io/crates/failure_derive/failure_derive-0.1.2.crate
  ref: 946d0e98a50d9831f5d589038d2ca7f8f455b1c21028c0db0e84116a12696426
- kind: crate
  url: https://static.crates.io/crates/filetime/filetime-0.2.1.crate
  ref: da4b9849e77b13195302c174324b5ba73eec9b236b24c221a61000daefb95c5f
- kind: crate
  url: https://static.crates.io/crates/flate2/flate2-1.0.2.crate
  ref: 37847f133aae7acf82bb9577ccd8bda241df836787642654286e79679826a54b
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
  url: https://static.crates.io/crates/git2/git2-0.7.5.crate
  ref: 591f8be1674b421644b6c030969520bc3fa12114d2eb467471982ed3e9584e71
- kind: crate
  url: https://static.crates.io/crates/git2-curl/git2-curl-0.8.1.crate
  ref: b502f6b1b467957403d168f0039e0c46fa6a1220efa2adaef25d5b267b5fe024
- kind: crate
  url: https://static.crates.io/crates/glob/glob-0.2.11.crate
  ref: 8be18de09a56b60ed0edf84bc9df007e30040691af7acd1c41874faac5895bfb
- kind: crate
  url: https://static.crates.io/crates/globset/globset-0.4.1.crate
  ref: 8e49edbcc9c7fc5beb8c0a54e7319ff8bed353a2b55e85811c6281188c2a6c84
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
  url: https://static.crates.io/crates/ignore/ignore-0.4.3.crate
  ref: 3e9faa7c84064f07b40da27044af629f578bc7994b650d3e458d0c29183c1d91
- kind: crate
  url: https://static.crates.io/crates/itoa/itoa-0.4.2.crate
  ref: 5adb58558dcd1d786b5f0bd15f3226ee23486e24b7b58304b60f64dc68e62606
- kind: crate
  url: https://static.crates.io/crates/jobserver/jobserver-0.1.11.crate
  ref: 60af5f849e1981434e4a31d3d782c4774ae9b434ce55b101a96ecfd09147e8be
- kind: crate
  url: https://static.crates.io/crates/kernel32-sys/kernel32-sys-0.2.2.crate
  ref: 7507624b29483431c0ba2d82aece8ca6cdba9382bff4ddd0f7490560c056098d
- kind: crate
  url: https://static.crates.io/crates/lazy_static/lazy_static-1.0.2.crate
  ref: fb497c35d362b6a331cfd94956a07fc2c78a4604cdbee844a81170386b996dd3
- kind: crate
  url: https://static.crates.io/crates/lazycell/lazycell-1.2.0.crate
  ref: ddba4c30a78328befecec92fc94970e53b3ae385827d28620f0f5bb2493081e0
- kind: crate
  url: https://static.crates.io/crates/libc/libc-0.2.42.crate
  ref: b685088df2b950fccadf07a7187c8ef846a959c142338a48f9dc0b94517eb5f1
- kind: crate
  url: https://static.crates.io/crates/libgit2-sys/libgit2-sys-0.7.7.crate
  ref: 6ab62b46003ba97701554631fa570d9f7e7947e2480ae3d941e555a54a2c0f05
- kind: crate
  url: https://static.crates.io/crates/libssh2-sys/libssh2-sys-0.2.8.crate
  ref: c628b499e8d1a4f4bd09a95d6cb1f8aeb231b46a9d40959bbd0408f14dd63adf
- kind: crate
  url: https://static.crates.io/crates/libz-sys/libz-sys-1.0.18.crate
  ref: 87f737ad6cc6fd6eefe3d9dc5412f1573865bded441300904d2f42269e140f16
- kind: crate
  url: https://static.crates.io/crates/log/log-0.4.3.crate
  ref: 61bd98ae7f7b754bc53dca7d44b604f733c6bba044ea6f41bc8d89272d8161d2
- kind: crate
  url: https://static.crates.io/crates/matches/matches-0.1.7.crate
  ref: 835511bab37c34c47da5cb44844bea2cfde0236db0b506f90ea4224482c9774a
- kind: crate
  url: https://static.crates.io/crates/memchr/memchr-2.0.1.crate
  ref: 796fba70e76612589ed2ce7f45282f5af869e0fdd7cc6199fa1aa1f1d591ba9d
- kind: crate
  url: https://static.crates.io/crates/miniz-sys/miniz-sys-0.1.10.crate
  ref: 609ce024854aeb19a0ef7567d348aaa5a746b32fb72e336df7fcc16869d7e2b4
- kind: crate
  url: https://static.crates.io/crates/miow/miow-0.3.1.crate
  ref: 9224c91f82b3c47cf53dcf78dfaa20d6888fbcc5d272d5f2fcdf8a697f3c987d
- kind: crate
  url: https://static.crates.io/crates/num_cpus/num_cpus-1.8.0.crate
  ref: c51a3322e4bca9d212ad9a158a02abc6934d005490c054a2778df73a70aa0a30
- kind: crate
  url: https://static.crates.io/crates/openssl/openssl-0.10.12.crate
  ref: 5e2e79eede055813a3ac52fb3915caf8e1c9da2dec1587871aec9f6f7b48508d
- kind: crate
  url: https://static.crates.io/crates/openssl-probe/openssl-probe-0.1.2.crate
  ref: 77af24da69f9d9341038eba93a073b1fdaaa1b788221b00a69bce9e762cb32de
- kind: crate
  url: https://static.crates.io/crates/openssl-src/openssl-src-110.0.7+1.1.0i.crate
  ref: c02d15268b7d1b3f0c83a2358f3d981139b54079440f1e2a29c60c1818ad5516
- kind: crate
  url: https://static.crates.io/crates/openssl-sys/openssl-sys-0.9.36.crate
  ref: 409d77eeb492a1aebd6eb322b2ee72ff7c7496b4434d98b3bf8be038755de65e
- kind: crate
  url: https://static.crates.io/crates/percent-encoding/percent-encoding-1.0.1.crate
  ref: 31010dd2e1ac33d5b46a5b413495239882813e0369f8ed8a5e266f173602f831
- kind: crate
  url: https://static.crates.io/crates/pkg-config/pkg-config-0.3.12.crate
  ref: 6a52e4dbc8354505ee07e484ab07127e06d87ca6fa7f0a516a2b294e5ad5ad16
- kind: crate
  url: https://static.crates.io/crates/proc-macro2/proc-macro2-0.4.9.crate
  ref: cccdc7557a98fe98453030f077df7f3a042052fae465bb61d2c2c41435cfd9b6
- kind: crate
  url: https://static.crates.io/crates/quick-error/quick-error-1.2.2.crate
  ref: 9274b940887ce9addde99c4eee6b5c44cc494b182b97e73dc8ffdcb3397fd3f0
- kind: crate
  url: https://static.crates.io/crates/quote/quote-0.6.4.crate
  ref: b71f9f575d55555aa9c06188be9d4e2bfc83ed02537948ac0d520c24d0419f1a
- kind: crate
  url: https://static.crates.io/crates/rand/rand-0.4.2.crate
  ref: eba5f8cb59cc50ed56be8880a5c7b496bfd9bd26394e176bc67884094145c2c5
- kind: crate
  url: https://static.crates.io/crates/rand/rand-0.5.4.crate
  ref: 12397506224b2f93e6664ffc4f664b29be8208e5157d3d90b44f09b5fae470ea
- kind: crate
  url: https://static.crates.io/crates/rand_core/rand_core-0.2.1.crate
  ref: edecf0f94da5551fc9b492093e30b041a891657db7940ee221f9d2f66e82eef2
- kind: crate
  url: https://static.crates.io/crates/redox_syscall/redox_syscall-0.1.40.crate
  ref: c214e91d3ecf43e9a4e41e578973adeb14b474f2bee858742d127af75a0112b1
- kind: crate
  url: https://static.crates.io/crates/redox_termios/redox_termios-0.1.1.crate
  ref: 7e891cfe48e9100a70a3b6eb652fef28920c117d366339687bd5576160db0f76
- kind: crate
  url: https://static.crates.io/crates/regex/regex-1.0.2.crate
  ref: 5bbbea44c5490a1e84357ff28b7d518b4619a159fed5d25f6c1de2d19cc42814
- kind: crate
  url: https://static.crates.io/crates/regex-syntax/regex-syntax-0.6.2.crate
  ref: 747ba3b235651f6e2f67dfa8bcdcd073ddb7c243cb21c442fc12395dfcac212d
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
  url: https://static.crates.io/crates/rustfix/rustfix-0.4.2.crate
  ref: 756567f00f7d89c9f89a5c401b8b1caaa122e27240b9eaadd0bb52ee0b680b1b
- kind: crate
  url: https://static.crates.io/crates/same-file/same-file-1.0.2.crate
  ref: cfb6eded0b06a0b512c8ddbcf04089138c9b4362c2f696f3c3d76039d68f3637
- kind: crate
  url: https://static.crates.io/crates/schannel/schannel-0.1.13.crate
  ref: dc1fabf2a7b6483a141426e1afd09ad543520a77ac49bd03c286e7696ccfd77f
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
  url: https://static.crates.io/crates/serde/serde-1.0.70.crate
  ref: 0c3adf19c07af6d186d91dae8927b83b0553d07ca56cbf7f2f32560455c91920
- kind: crate
  url: https://static.crates.io/crates/serde_derive/serde_derive-1.0.70.crate
  ref: 3525a779832b08693031b8ecfb0de81cd71cfd3812088fafe9a7496789572124
- kind: crate
  url: https://static.crates.io/crates/serde_ignored/serde_ignored-0.0.4.crate
  ref: 190e9765dcedb56be63b6e0993a006c7e3b071a016a304736e4a315dc01fb142
- kind: crate
  url: https://static.crates.io/crates/serde_json/serde_json-1.0.24.crate
  ref: c3c6908c7b925cd6c590358a4034de93dbddb20c45e1d021931459fd419bf0e2
- kind: crate
  url: https://static.crates.io/crates/shell-escape/shell-escape-0.1.4.crate
  ref: 170a13e64f2a51b77a45702ba77287f5c6829375b04a69cf2222acd17d0cfab9
- kind: crate
  url: https://static.crates.io/crates/socket2/socket2-0.3.7.crate
  ref: 962a516af4d3a7c272cb3a1d50a8cc4e5b41802e4ad54cfb7bee8ba61d37d703
- kind: crate
  url: https://static.crates.io/crates/strsim/strsim-0.7.0.crate
  ref: bb4f380125926a99e52bc279241539c018323fab05ad6368b56f93d9369ff550
- kind: crate
  url: https://static.crates.io/crates/syn/syn-0.14.6.crate
  ref: 4e4b5274d4a0a3d2749d5c158dc64d3403e60554dc61194648787ada5212473d
- kind: crate
  url: https://static.crates.io/crates/synstructure/synstructure-0.9.0.crate
  ref: 85bb9b7550d063ea184027c9b8c20ac167cd36d3e06b3a40bceb9d746dc1a7b7
- kind: crate
  url: https://static.crates.io/crates/tar/tar-0.4.16.crate
  ref: e8f41ca4a5689f06998f0247fcb60da6c760f1950cc9df2a10d71575ad0b062a
- kind: crate
  url: https://static.crates.io/crates/tempfile/tempfile-3.0.3.crate
  ref: c4b103c6d08d323b92ff42c8ce62abcd83ca8efa7fd5bf7927efefec75f58c76
- kind: crate
  url: https://static.crates.io/crates/termcolor/termcolor-1.0.1.crate
  ref: 722426c4a0539da2c4ffd9b419d90ad540b4cff4a053be9069c908d4d07e2836
- kind: crate
  url: https://static.crates.io/crates/termion/termion-1.5.1.crate
  ref: 689a3bdfaab439fd92bc87df5c4c78417d3cbe537487274e9b0b2dce76e92096
- kind: crate
  url: https://static.crates.io/crates/textwrap/textwrap-0.10.0.crate
  ref: 307686869c93e71f94da64286f9a9524c0f308a9e1c87a583de8e9c9039ad3f6
- kind: crate
  url: https://static.crates.io/crates/thread_local/thread_local-0.3.5.crate
  ref: 279ef31c19ededf577bfd12dfae728040a21f635b06a24cd670ff510edd38963
- kind: crate
  url: https://static.crates.io/crates/toml/toml-0.4.6.crate
  ref: a0263c6c02c4db6c8f7681f9fd35e90de799ebd4cfdeab77a38f4ff6b3d8c0d9
- kind: crate
  url: https://static.crates.io/crates/ucd-util/ucd-util-0.1.1.crate
  ref: fd2be2d6639d0f8fe6cdda291ad456e23629558d466e2789d2c3e9892bda285d
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
  url: https://static.crates.io/crates/url/url-1.7.1.crate
  ref: 2a321979c09843d272956e73700d12c4e7d3d92b2ee112b31548aef0d4efc5a6
- kind: crate
  url: https://static.crates.io/crates/utf8-ranges/utf8-ranges-1.0.0.crate
  ref: 662fab6525a98beff2921d7f61a39e7d59e0b425ebc7d0d9e66d316e55124122
- kind: crate
  url: https://static.crates.io/crates/vcpkg/vcpkg-0.2.4.crate
  ref: cbe533e138811704c0e3cbde65a818b35d3240409b4346256c5ede403e082474
- kind: crate
  url: https://static.crates.io/crates/vec_map/vec_map-0.8.1.crate
  ref: 05c78687fb1a80548ae3250346c3db86a80a7cdd77bda190189f2d0a0987c81a
- kind: crate
  url: https://static.crates.io/crates/void/void-1.0.2.crate
  ref: 6a02e4885ed3bc0f2de90ea6dd45ebcbb66dacffe03547fadbb0eeae2770887d
- kind: crate
  url: https://static.crates.io/crates/walkdir/walkdir-2.1.4.crate
  ref: 63636bd0eb3d00ccb8b9036381b526efac53caf112b7783b730ab3f8e44da369
- kind: crate
  url: https://static.crates.io/crates/winapi/winapi-0.2.8.crate
  ref: 167dc9d6949a9b857f3451275e911c3f44255842c1f7a76f33c55103a909087a
- kind: crate
  url: https://static.crates.io/crates/winapi/winapi-0.3.5.crate
  ref: 773ef9dcc5f24b7d850d0ff101e542ff24c3b090a9768e03ff889fdef41f00fd
- kind: crate
  url: https://static.crates.io/crates/winapi-build/winapi-build-0.1.1.crate
  ref: 2d315eee3b34aca4797b2da6b13ed88266e6d612562a0c46390af8299fc699bc
- kind: crate
  url: https://static.crates.io/crates/winapi-i686-pc-windows-gnu/winapi-i686-pc-windows-gnu-0.4.0.crate
  ref: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
- kind: crate
  url: https://static.crates.io/crates/winapi-x86_64-pc-windows-gnu/winapi-x86_64-pc-windows-gnu-0.4.0.crate
  ref: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
- kind: crate
  url: https://static.crates.io/crates/wincolor/wincolor-1.0.0.crate
  ref: b9dc3aa9dcda98b5a16150c54619c1ead22e3d3a5d458778ae914be760aa981a
