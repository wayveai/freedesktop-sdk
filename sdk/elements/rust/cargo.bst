kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: rust/cargo-stage1.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: rust/rust.bst
  - filename: base/openssl.bst
  - filename: base/cmake.bst
    type: build
  - filename: base/perl.bst
    type: build

variables:
  prefix: "/usr/lib/sdk/rust"
  lib: "lib"
  debugdir: "/usr/lib/debug"

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
  CARGO_HOME: "%{build-root}/home"
  PATH: "/usr/bin:%{bindir}"

sources:
  - kind: tar
    url: https://github.com/rust-lang/cargo/archive/0.27.0.tar.gz
    directory: source
    ref: fae0bd136cc7622bde3e1c3d0bfefaed4d610b0fe6c7618a0a215ce2aba2bde1

# The following is generated with script generate_cargo_dependencies.py
  - kind: crate
    url: https://static.crates.io/crates/aho-corasick/aho-corasick-0.6.4.crate
    ref: d6531d44de723825aa81398a6415283229725a00fa30713812ab9323faa82fc4
  - kind: crate
    url: https://static.crates.io/crates/ansi_term/ansi_term-0.11.0.crate
    ref: ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b
  - kind: crate
    url: https://static.crates.io/crates/atty/atty-0.2.10.crate
    ref: 2fc4a1aa4c24c0718a250f0681885c1af91419d242f29eb8f2ab28502d80dbd1
  - kind: crate
    url: https://static.crates.io/crates/backtrace/backtrace-0.3.8.crate
    ref: dbdd17cd962b570302f5297aea8648d5923e22e555c2ed2d8b2e34eca646bf6d
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
    url: https://static.crates.io/crates/cc/cc-1.0.17.crate
    ref: 49ec142f5768efb5b7622aebc3fdbdbb8950a4b9ba996393cb76ef7466e8747d
  - kind: crate
    url: https://static.crates.io/crates/cfg-if/cfg-if-0.1.3.crate
    ref: 405216fd8fe65f718daa7102ea808a946b6ce40c742998fbfd3463645552de18
  - kind: crate
    url: https://static.crates.io/crates/clap/clap-2.31.2.crate
    ref: f0f16b89cbb9ee36d87483dc939fe9f1e13c05898d56d7b230a0d4dff033a536
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
    url: https://static.crates.io/crates/core-foundation/core-foundation-0.5.1.crate
    ref: 286e0b41c3a20da26536c6000a280585d519fd07b3956b43aed8a79e9edce980
  - kind: crate
    url: https://static.crates.io/crates/core-foundation-sys/core-foundation-sys-0.5.1.crate
    ref: 716c271e8613ace48344f723b60b900a93150271e5be206212d052bbc0883efa
  - kind: crate
    url: https://static.crates.io/crates/crossbeam/crossbeam-0.3.2.crate
    ref: 24ce9782d4d5c53674646a6a4c1863a21a8fc0cb649b3c94dfc16e45071dea19
  - kind: crate
    url: https://static.crates.io/crates/crypto-hash/crypto-hash-0.3.1.crate
    ref: 09de9ee0fc255ace04c7fa0763c9395a945c37c8292bb554f8d48361d1dcf1b4
  - kind: crate
    url: https://static.crates.io/crates/curl/curl-0.4.12.crate
    ref: aaf20bbe084f285f215eef2165feed70d6b75ba29cad24469badb853a4a287d0
  - kind: crate
    url: https://static.crates.io/crates/curl-sys/curl-sys-0.4.5.crate
    ref: 71c63a540a9ee4e15e56c3ed9b11a2f121239b9f6d7b7fe30f616e048148df9a
  - kind: crate
    url: https://static.crates.io/crates/dtoa/dtoa-0.4.2.crate
    ref: 09c3753c3db574d215cba4ea76018483895d7bff25a31b49ba45db21c48e50ab
  - kind: crate
    url: https://static.crates.io/crates/env_logger/env_logger-0.5.10.crate
    ref: 0e6e40ebb0e66918a37b38c7acab4e10d299e0463fe2af5d29b9cc86710cfd2a
  - kind: crate
    url: https://static.crates.io/crates/failure/failure-0.1.1.crate
    ref: 934799b6c1de475a012a02dab0ace1ace43789ee4b99bcfbf1a2e3e8ced5de82
  - kind: crate
    url: https://static.crates.io/crates/failure_derive/failure_derive-0.1.1.crate
    ref: c7cdda555bb90c9bb67a3b670a0f42de8e73f5981524123ad8578aafec8ddb8b
  - kind: crate
    url: https://static.crates.io/crates/filetime/filetime-0.1.15.crate
    ref: 714653f3e34871534de23771ac7b26e999651a0a228f47beb324dfdf1dd4b10f
  - kind: crate
    url: https://static.crates.io/crates/filetime/filetime-0.2.1.crate
    ref: da4b9849e77b13195302c174324b5ba73eec9b236b24c221a61000daefb95c5f
  - kind: crate
    url: https://static.crates.io/crates/flate2/flate2-1.0.1.crate
    ref: 9fac2277e84e5e858483756647a9d0aa8d9a2b7cba517fd84325a0aaa69a0909
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
    url: https://static.crates.io/crates/git2/git2-0.7.1.crate
    ref: 0f41c0035c37ec11ed3f1e1946a76070b0c740393687e9a9c7612f6a709036b3
  - kind: crate
    url: https://static.crates.io/crates/git2-curl/git2-curl-0.8.1.crate
    ref: b502f6b1b467957403d168f0039e0c46fa6a1220efa2adaef25d5b267b5fe024
  - kind: crate
    url: https://static.crates.io/crates/glob/glob-0.2.11.crate
    ref: 8be18de09a56b60ed0edf84bc9df007e30040691af7acd1c41874faac5895bfb
  - kind: crate
    url: https://static.crates.io/crates/globset/globset-0.4.0.crate
    ref: 142754da2c9b3722affd909f9e27f2a6700a7a303f362971e0a74c652005a43d
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
    url: https://static.crates.io/crates/idna/idna-0.1.4.crate
    ref: 014b298351066f1512874135335d62a789ffe78a9974f94b43ed5621951eaf7d
  - kind: crate
    url: https://static.crates.io/crates/ignore/ignore-0.4.2.crate
    ref: 787a5940ab88e0f2f3b2cad3687060bddcf67520f3b761abc31065c9c495d088
  - kind: crate
    url: https://static.crates.io/crates/itoa/itoa-0.4.1.crate
    ref: c069bbec61e1ca5a596166e55dfe4773ff745c3d16b700013bcaff9a6df2c682
  - kind: crate
    url: https://static.crates.io/crates/jobserver/jobserver-0.1.11.crate
    ref: 60af5f849e1981434e4a31d3d782c4774ae9b434ce55b101a96ecfd09147e8be
  - kind: crate
    url: https://static.crates.io/crates/kernel32-sys/kernel32-sys-0.2.2.crate
    ref: 7507624b29483431c0ba2d82aece8ca6cdba9382bff4ddd0f7490560c056098d
  - kind: crate
    url: https://static.crates.io/crates/lazy_static/lazy_static-1.0.1.crate
    ref: e6412c5e2ad9584b0b8e979393122026cdd6d2a80b933f890dcd694ddbe73739
  - kind: crate
    url: https://static.crates.io/crates/lazycell/lazycell-0.6.0.crate
    ref: a6f08839bc70ef4a3fe1d566d5350f519c5912ea86be0df1740a7d247c7fc0ef
  - kind: crate
    url: https://static.crates.io/crates/libc/libc-0.2.42.crate
    ref: b685088df2b950fccadf07a7187c8ef846a959c142338a48f9dc0b94517eb5f1
  - kind: crate
    url: https://static.crates.io/crates/libgit2-sys/libgit2-sys-0.7.3.crate
    ref: 9cc8a747e1d0254ef5eb71330fcb8fb25b8b8f8dc1981379b7bb06d6f006672e
  - kind: crate
    url: https://static.crates.io/crates/libssh2-sys/libssh2-sys-0.2.7.crate
    ref: 5afcb36f9a2012ab8d3a9ba5186ee2d1c4587acf199cb47879a73c5fe1b731a4
  - kind: crate
    url: https://static.crates.io/crates/libz-sys/libz-sys-1.0.18.crate
    ref: 87f737ad6cc6fd6eefe3d9dc5412f1573865bded441300904d2f42269e140f16
  - kind: crate
    url: https://static.crates.io/crates/log/log-0.4.2.crate
    ref: 6fddaa003a65722a7fb9e26b0ce95921fe4ba590542ced664d8ce2fa26f9f3ac
  - kind: crate
    url: https://static.crates.io/crates/matches/matches-0.1.6.crate
    ref: 100aabe6b8ff4e4a7e32c1c13523379802df0772b82466207ac25b013f193376
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
    url: https://static.crates.io/crates/num-traits/num-traits-0.2.4.crate
    ref: 775393e285254d2f5004596d69bb8bc1149754570dcc08cf30cabeba67955e28
  - kind: crate
    url: https://static.crates.io/crates/num_cpus/num_cpus-1.8.0.crate
    ref: c51a3322e4bca9d212ad9a158a02abc6934d005490c054a2778df73a70aa0a30
  - kind: crate
    url: https://static.crates.io/crates/openssl/openssl-0.10.10.crate
    ref: ed18a0f40ec4e9a8a81f8865033d823b7195d16a0a5721e10963ee1b0c2980ca
  - kind: crate
    url: https://static.crates.io/crates/openssl-probe/openssl-probe-0.1.2.crate
    ref: 77af24da69f9d9341038eba93a073b1fdaaa1b788221b00a69bce9e762cb32de
  - kind: crate
    url: https://static.crates.io/crates/openssl-sys/openssl-sys-0.9.33.crate
    ref: d8abc04833dcedef24221a91852931df2f63e3369ae003134e70aff3645775cc
  - kind: crate
    url: https://static.crates.io/crates/percent-encoding/percent-encoding-1.0.1.crate
    ref: 31010dd2e1ac33d5b46a5b413495239882813e0369f8ed8a5e266f173602f831
  - kind: crate
    url: https://static.crates.io/crates/pkg-config/pkg-config-0.3.11.crate
    ref: 110d5ee3593dbb73f56294327fe5668bcc997897097cbc76b51e7aed3f52452f
  - kind: crate
    url: https://static.crates.io/crates/proc-macro2/proc-macro2-0.4.6.crate
    ref: effdb53b25cdad54f8f48843d67398f7ef2e14f12c1b4cb4effc549a6462a4d6
  - kind: crate
    url: https://static.crates.io/crates/quick-error/quick-error-1.2.2.crate
    ref: 9274b940887ce9addde99c4eee6b5c44cc494b182b97e73dc8ffdcb3397fd3f0
  - kind: crate
    url: https://static.crates.io/crates/quote/quote-0.3.15.crate
    ref: 7a6e920b65c65f10b2ae65c831a81a073a89edd28c7cce89475bff467ab4167a
  - kind: crate
    url: https://static.crates.io/crates/quote/quote-0.6.3.crate
    ref: e44651a0dc4cdd99f71c83b561e221f714912d11af1a4dff0631f923d53af035
  - kind: crate
    url: https://static.crates.io/crates/rand/rand-0.4.2.crate
    ref: eba5f8cb59cc50ed56be8880a5c7b496bfd9bd26394e176bc67884094145c2c5
  - kind: crate
    url: https://static.crates.io/crates/redox_syscall/redox_syscall-0.1.40.crate
    ref: c214e91d3ecf43e9a4e41e578973adeb14b474f2bee858742d127af75a0112b1
  - kind: crate
    url: https://static.crates.io/crates/redox_termios/redox_termios-0.1.1.crate
    ref: 7e891cfe48e9100a70a3b6eb652fef28920c117d366339687bd5576160db0f76
  - kind: crate
    url: https://static.crates.io/crates/regex/regex-0.2.11.crate
    ref: 9329abc99e39129fcceabd24cf5d85b4671ef7c29c50e972bc5afe32438ec384
  - kind: crate
    url: https://static.crates.io/crates/regex/regex-1.0.0.crate
    ref: 75ecf88252dce580404a22444fc7d626c01815debba56a7f4f536772a5ff19d3
  - kind: crate
    url: https://static.crates.io/crates/regex-syntax/regex-syntax-0.5.6.crate
    ref: 7d707a4fa2637f2dca2ef9fd02225ec7661fe01a53623c1e6515b6916511f7a7
  - kind: crate
    url: https://static.crates.io/crates/regex-syntax/regex-syntax-0.6.1.crate
    ref: 05b06a75f5217880fc5e905952a42750bf44787e56a6c6d6852ed0992f5e1d54
  - kind: crate
    url: https://static.crates.io/crates/remove_dir_all/remove_dir_all-0.5.1.crate
    ref: 3488ba1b9a2084d38645c4c08276a1752dcbf2c7130d74f1569681ad5d2799c5
  - kind: crate
    url: https://static.crates.io/crates/rustc-demangle/rustc-demangle-0.1.8.crate
    ref: 76d7ba1feafada44f2d38eed812bd2489a03c0f5abb975799251518b68848649
  - kind: crate
    url: https://static.crates.io/crates/same-file/same-file-1.0.2.crate
    ref: cfb6eded0b06a0b512c8ddbcf04089138c9b4362c2f696f3c3d76039d68f3637
  - kind: crate
    url: https://static.crates.io/crates/schannel/schannel-0.1.12.crate
    ref: 85fd9df495640643ad2d00443b3d78aae69802ad488debab4f1dd52fc1806ade
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
    url: https://static.crates.io/crates/serde/serde-1.0.66.crate
    ref: e9a2d9a9ac5120e0f768801ca2b58ad6eec929dc9d1d616c162f208869c2ce95
  - kind: crate
    url: https://static.crates.io/crates/serde_derive/serde_derive-1.0.66.crate
    ref: 0a90213fa7e0f5eac3f7afe2d5ff6b088af515052cc7303bd68c7e3b91a3fb79
  - kind: crate
    url: https://static.crates.io/crates/serde_ignored/serde_ignored-0.0.4.crate
    ref: 190e9765dcedb56be63b6e0993a006c7e3b071a016a304736e4a315dc01fb142
  - kind: crate
    url: https://static.crates.io/crates/serde_json/serde_json-1.0.20.crate
    ref: fc97cccc2959f39984524026d760c08ef0dd5f0f5948c8d31797dbfae458c875
  - kind: crate
    url: https://static.crates.io/crates/shell-escape/shell-escape-0.1.4.crate
    ref: 170a13e64f2a51b77a45702ba77287f5c6829375b04a69cf2222acd17d0cfab9
  - kind: crate
    url: https://static.crates.io/crates/socket2/socket2-0.3.6.crate
    ref: 06dc9f86ee48652b7c80f3d254e3b9accb67a928c562c64d10d7b016d3d98dab
  - kind: crate
    url: https://static.crates.io/crates/strsim/strsim-0.7.0.crate
    ref: bb4f380125926a99e52bc279241539c018323fab05ad6368b56f93d9369ff550
  - kind: crate
    url: https://static.crates.io/crates/syn/syn-0.11.11.crate
    ref: d3b891b9015c88c576343b9b3e41c2c11a51c219ef067b264bd9c8aa9b441dad
  - kind: crate
    url: https://static.crates.io/crates/syn/syn-0.14.2.crate
    ref: c67da57e61ebc7b7b6fff56bb34440ca3a83db037320b0507af4c10368deda7d
  - kind: crate
    url: https://static.crates.io/crates/synom/synom-0.11.3.crate
    ref: a393066ed9010ebaed60b9eafa373d4b1baac186dd7e008555b0f702b51945b6
  - kind: crate
    url: https://static.crates.io/crates/synstructure/synstructure-0.6.1.crate
    ref: 3a761d12e6d8dcb4dcf952a7a89b475e3a9d69e4a69307e01a470977642914bd
  - kind: crate
    url: https://static.crates.io/crates/tar/tar-0.4.15.crate
    ref: 6af6b94659f9a571bf769a5b71f54079393585ee0bfdd71b691be22d7d6b1d18
  - kind: crate
    url: https://static.crates.io/crates/tempfile/tempfile-3.0.2.crate
    ref: 47776f63b85777d984a50ce49d6b9e58826b6a3766a449fc95bc66cd5663c15b
  - kind: crate
    url: https://static.crates.io/crates/termcolor/termcolor-0.3.6.crate
    ref: adc4587ead41bf016f11af03e55a624c06568b5a19db4e90fde573d805074f83
  - kind: crate
    url: https://static.crates.io/crates/termion/termion-1.5.1.crate
    ref: 689a3bdfaab439fd92bc87df5c4c78417d3cbe537487274e9b0b2dce76e92096
  - kind: crate
    url: https://static.crates.io/crates/textwrap/textwrap-0.9.0.crate
    ref: c0b59b6b4b44d867f1370ef1bd91bfb262bf07bf0ae65c202ea2fbc16153b693
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
    url: https://static.crates.io/crates/unicode-xid/unicode-xid-0.0.4.crate
    ref: 8c1f860d7d29cf02cb2f3f359fd35991af3d30bac52c57d265a3c461074cb4dc
  - kind: crate
    url: https://static.crates.io/crates/unicode-xid/unicode-xid-0.1.0.crate
    ref: fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc
  - kind: crate
    url: https://static.crates.io/crates/unreachable/unreachable-1.0.0.crate
    ref: 382810877fe448991dfc7f0dd6e3ae5d58088fd0ea5e35189655f84e6814fa56
  - kind: crate
    url: https://static.crates.io/crates/url/url-1.7.0.crate
    ref: f808aadd8cfec6ef90e4a14eb46f24511824d1ac596b9682703c87056c8678b7
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
    url: https://static.crates.io/crates/wincolor/wincolor-0.1.6.crate
    ref: eeb06499a3a4d44302791052df005d5232b927ed1a9658146d842165c4de7767
