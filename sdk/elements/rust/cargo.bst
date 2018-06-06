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
    url: https://github.com/rust-lang/cargo/archive/0.26.0.tar.gz
    ref: 1a4bae6910ca895157a1abe8225eb2b7e9b49ee1ee1e4e72fb81cb8e1446bff9
    directory: source

# The following is generated with script generate_cargo_dependencies.py
  - kind: crate
    url: https://static.crates.io/crates/aho-corasick/aho-corasick-0.5.3.crate
    ref: ca972c2ea5f742bfce5687b9aef75506a764f61d37f8f649047846a9686ddb66
  - kind: crate
    url: https://static.crates.io/crates/aho-corasick/aho-corasick-0.6.4.crate
    ref: d6531d44de723825aa81398a6415283229725a00fa30713812ab9323faa82fc4
  - kind: crate
    url: https://static.crates.io/crates/atty/atty-0.2.8.crate
    ref: af80143d6f7608d746df1520709e5d141c96f240b0e62b0aa41bdfb53374d9d4
  - kind: crate
    url: https://static.crates.io/crates/backtrace/backtrace-0.3.5.crate
    ref: ebbbf59b1c43eefa8c3ede390fcc36820b4999f7914104015be25025e0d62af2
  - kind: crate
    url: https://static.crates.io/crates/backtrace-sys/backtrace-sys-0.1.16.crate
    ref: 44585761d6161b0f57afc49482ab6bd067e4edef48c12a152c237eb0203f7661
  - kind: crate
    url: https://static.crates.io/crates/bitflags/bitflags-0.9.1.crate
    ref: 4efd02e230a02e18f92fc2735f44597385ed02ad8f831e7c1c1156ee5e1ab3a5
  - kind: crate
    url: https://static.crates.io/crates/bitflags/bitflags-1.0.1.crate
    ref: b3c30d3802dfb7281680d6285f2ccdaa8c2d8fee41f93805dba5c4cf50dc23cf
  - kind: crate
    url: https://static.crates.io/crates/bufstream/bufstream-0.1.3.crate
    ref: f2f382711e76b9de6c744cc00d0497baba02fb00a787f088c879f01d09468e32
  - kind: crate
    url: https://static.crates.io/crates/cc/cc-1.0.9.crate
    ref: 2b4911e4bdcb4100c7680e7e854ff38e23f1b34d4d9e079efae3da2801341ffc
  - kind: crate
    url: https://static.crates.io/crates/cfg-if/cfg-if-0.1.2.crate
    ref: d4c819a1287eb618df47cc647173c5c4c66ba19d888a6e50d605672aed3140de
  - kind: crate
    url: https://static.crates.io/crates/cmake/cmake-0.1.30.crate
    ref: 5cf678ceebedde428000cb3a34465cf3606d1a48da17014948a916deac39da7c
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
    url: https://static.crates.io/crates/curl/curl-0.4.11.crate
    ref: b70fd6394677d3c0e239ff4be6f2b3176e171ffd1c23ffdc541e78dea2b8bb5e
  - kind: crate
    url: https://static.crates.io/crates/curl-sys/curl-sys-0.4.1.crate
    ref: f46e49c7125131f5afaded06944d6888b55cbdf8eba05dae73c954019b907961
  - kind: crate
    url: https://static.crates.io/crates/docopt/docopt-0.8.3.crate
    ref: d8acd393692c503b168471874953a2531df0e9ab77d0b6bbc582395743300a4a
  - kind: crate
    url: https://static.crates.io/crates/dtoa/dtoa-0.4.2.crate
    ref: 09c3753c3db574d215cba4ea76018483895d7bff25a31b49ba45db21c48e50ab
  - kind: crate
    url: https://static.crates.io/crates/env_logger/env_logger-0.5.6.crate
    ref: 0561146661ae44c579e993456bc76d11ce1e0c7d745e57b2fa7146b6e49fa2ad
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
    url: https://static.crates.io/crates/git2/git2-0.6.11.crate
    ref: ee5b4bb7cd2a44e6e5ee3a26ba6a9ca10d4ce2771cdc3839bbc54b47b7d1be84
  - kind: crate
    url: https://static.crates.io/crates/git2-curl/git2-curl-0.7.0.crate
    ref: 68676bc784bf0bef83278898929bf64a251e87c0340723d0b93fa096c9c5bf8e
  - kind: crate
    url: https://static.crates.io/crates/glob/glob-0.2.11.crate
    ref: 8be18de09a56b60ed0edf84bc9df007e30040691af7acd1c41874faac5895bfb
  - kind: crate
    url: https://static.crates.io/crates/globset/globset-0.3.0.crate
    ref: 1e96ab92362c06811385ae9a34d2698e8a1160745e0c78fbb434a44c8de3fabc
  - kind: crate
    url: https://static.crates.io/crates/hamcrest/hamcrest-0.1.1.crate
    ref: bf088f042a467089e9baa4972f57f9247e42a0cc549ba264c7a04fbb8ecb89d4
  - kind: crate
    url: https://static.crates.io/crates/hex/hex-0.3.1.crate
    ref: 459d3cf58137bb02ad4adeef5036377ff59f066dbb82517b7192e3a5462a2abc
  - kind: crate
    url: https://static.crates.io/crates/home/home-0.3.2.crate
    ref: 8f94f6fbdc000a6eba0c8cf08632b2091bb59141d36ac321a2a96d6365e5e4dc
  - kind: crate
    url: https://static.crates.io/crates/humantime/humantime-1.1.1.crate
    ref: 0484fda3e7007f2a4a0d9c3a703ca38c71c54c55602ce4660c419fd32e188c9e
  - kind: crate
    url: https://static.crates.io/crates/idna/idna-0.1.4.crate
    ref: 014b298351066f1512874135335d62a789ffe78a9974f94b43ed5621951eaf7d
  - kind: crate
    url: https://static.crates.io/crates/ignore/ignore-0.4.1.crate
    ref: 245bea0ba52531a3739cb8ba99f8689eda13d7faf8c36b6a73ce4421aab42588
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
    url: https://static.crates.io/crates/lazy_static/lazy_static-1.0.0.crate
    ref: c8f31047daa365f19be14b47c29df4f7c3b581832407daabe6ae77397619237d
  - kind: crate
    url: https://static.crates.io/crates/lazycell/lazycell-0.6.0.crate
    ref: a6f08839bc70ef4a3fe1d566d5350f519c5912ea86be0df1740a7d247c7fc0ef
  - kind: crate
    url: https://static.crates.io/crates/libc/libc-0.2.40.crate
    ref: 6fd41f331ac7c5b8ac259b8bf82c75c0fb2e469bbf37d2becbba9a6a2221965b
  - kind: crate
    url: https://static.crates.io/crates/libgit2-sys/libgit2-sys-0.6.19.crate
    ref: 6eeae66e7b1c995de45cb4e65c5ab438a96a7b4077e448645d4048dc753ad357
  - kind: crate
    url: https://static.crates.io/crates/libssh2-sys/libssh2-sys-0.2.6.crate
    ref: 0db4ec23611747ef772db1c4d650f8bd762f07b461727ec998f953c614024b75
  - kind: crate
    url: https://static.crates.io/crates/libz-sys/libz-sys-1.0.18.crate
    ref: 87f737ad6cc6fd6eefe3d9dc5412f1573865bded441300904d2f42269e140f16
  - kind: crate
    url: https://static.crates.io/crates/log/log-0.3.9.crate
    ref: e19e8d5c34a3e0e2223db8e060f9e8264aeeb5c5fc64a4ee9965c062211c024b
  - kind: crate
    url: https://static.crates.io/crates/log/log-0.4.1.crate
    ref: 89f010e843f2b1a31dbd316b3b8d443758bc634bed37aabade59c686d644e0a2
  - kind: crate
    url: https://static.crates.io/crates/matches/matches-0.1.6.crate
    ref: 100aabe6b8ff4e4a7e32c1c13523379802df0772b82466207ac25b013f193376
  - kind: crate
    url: https://static.crates.io/crates/memchr/memchr-0.1.11.crate
    ref: d8b629fb514376c675b98c1421e80b151d3817ac42d7c667717d282761418d20
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
    url: https://static.crates.io/crates/num/num-0.1.42.crate
    ref: 4703ad64153382334aa8db57c637364c322d3372e097840c72000dabdcf6156e
  - kind: crate
    url: https://static.crates.io/crates/num-bigint/num-bigint-0.1.43.crate
    ref: 81b483ea42927c463e191802e7334556b48e7875297564c0e9951bd3a0ae53e3
  - kind: crate
    url: https://static.crates.io/crates/num-complex/num-complex-0.1.43.crate
    ref: b288631d7878aaf59442cffd36910ea604ecd7745c36054328595114001c9656
  - kind: crate
    url: https://static.crates.io/crates/num-integer/num-integer-0.1.36.crate
    ref: f8d26da319fb45674985c78f1d1caf99aa4941f785d384a2ae36d0740bc3e2fe
  - kind: crate
    url: https://static.crates.io/crates/num-iter/num-iter-0.1.35.crate
    ref: 4b226df12c5a59b63569dd57fafb926d91b385dfce33d8074a412411b689d593
  - kind: crate
    url: https://static.crates.io/crates/num-rational/num-rational-0.1.42.crate
    ref: ee314c74bd753fc86b4780aa9475da469155f3848473a261d2d18e35245a784e
  - kind: crate
    url: https://static.crates.io/crates/num-traits/num-traits-0.2.2.crate
    ref: dee092fcdf725aee04dd7da1d21debff559237d49ef1cb3e69bcb8ece44c7364
  - kind: crate
    url: https://static.crates.io/crates/num_cpus/num_cpus-1.8.0.crate
    ref: c51a3322e4bca9d212ad9a158a02abc6934d005490c054a2778df73a70aa0a30
  - kind: crate
    url: https://static.crates.io/crates/openssl/openssl-0.10.6.crate
    ref: 63246f69962e8d5ef865f82a65241d6483c8a2905a1801e2f7feb5d187d51320
  - kind: crate
    url: https://static.crates.io/crates/openssl-probe/openssl-probe-0.1.2.crate
    ref: 77af24da69f9d9341038eba93a073b1fdaaa1b788221b00a69bce9e762cb32de
  - kind: crate
    url: https://static.crates.io/crates/openssl-sys/openssl-sys-0.9.28.crate
    ref: 0bbd90640b148b46305c1691eed6039b5c8509bed16991e3562a01eeb76902a3
  - kind: crate
    url: https://static.crates.io/crates/percent-encoding/percent-encoding-1.0.1.crate
    ref: 31010dd2e1ac33d5b46a5b413495239882813e0369f8ed8a5e266f173602f831
  - kind: crate
    url: https://static.crates.io/crates/pkg-config/pkg-config-0.3.9.crate
    ref: 3a8b4c6b8165cd1a1cd4b9b120978131389f64bdaf456435caa41e630edba903
  - kind: crate
    url: https://static.crates.io/crates/proc-macro2/proc-macro2-0.3.5.crate
    ref: 77997c53ae6edd6d187fec07ec41b207063b5ee6f33680e9fa86d405cdd313d4
  - kind: crate
    url: https://static.crates.io/crates/quick-error/quick-error-1.2.1.crate
    ref: eda5fe9b71976e62bc81b781206aaa076401769b2143379d3eb2118388babac4
  - kind: crate
    url: https://static.crates.io/crates/quote/quote-0.3.15.crate
    ref: 7a6e920b65c65f10b2ae65c831a81a073a89edd28c7cce89475bff467ab4167a
  - kind: crate
    url: https://static.crates.io/crates/quote/quote-0.5.1.crate
    ref: 7b0ff51282f28dc1b53fd154298feaa2e77c5ea0dba68e1fd8b03b72fbe13d2a
  - kind: crate
    url: https://static.crates.io/crates/rand/rand-0.4.2.crate
    ref: eba5f8cb59cc50ed56be8880a5c7b496bfd9bd26394e176bc67884094145c2c5
  - kind: crate
    url: https://static.crates.io/crates/redox_syscall/redox_syscall-0.1.37.crate
    ref: 0d92eecebad22b767915e4d529f89f28ee96dbbf5a4810d2b844373f136417fd
  - kind: crate
    url: https://static.crates.io/crates/redox_termios/redox_termios-0.1.1.crate
    ref: 7e891cfe48e9100a70a3b6eb652fef28920c117d366339687bd5576160db0f76
  - kind: crate
    url: https://static.crates.io/crates/regex/regex-0.1.80.crate
    ref: 4fd4ace6a8cf7860714a2c2280d6c1f7e6a413486c13298bbc86fd3da019402f
  - kind: crate
    url: https://static.crates.io/crates/regex/regex-0.2.10.crate
    ref: aec3f58d903a7d2a9dc2bf0e41a746f4530e0cab6b615494e058f67a3ef947fb
  - kind: crate
    url: https://static.crates.io/crates/regex-syntax/regex-syntax-0.3.9.crate
    ref: f9ec002c35e86791825ed294b50008eea9ddfc8def4420124fbc6b08db834957
  - kind: crate
    url: https://static.crates.io/crates/regex-syntax/regex-syntax-0.5.3.crate
    ref: b2550876c31dc914696a6c2e01cbce8afba79a93c8ae979d2fe051c0230b3756
  - kind: crate
    url: https://static.crates.io/crates/remove_dir_all/remove_dir_all-0.5.0.crate
    ref: dfc5b3ce5d5ea144bb04ebd093a9e14e9765bcfec866aecda9b6dec43b3d1e24
  - kind: crate
    url: https://static.crates.io/crates/rustc-demangle/rustc-demangle-0.1.7.crate
    ref: 11fb43a206a04116ffd7cfcf9bcb941f8eb6cc7ff667272246b0a1c74259a3cb
  - kind: crate
    url: https://static.crates.io/crates/rustc-serialize/rustc-serialize-0.3.24.crate
    ref: dcf128d1287d2ea9d80910b5f1120d0b8eede3fbf1abe91c40d39ea7d51e6fda
  - kind: crate
    url: https://static.crates.io/crates/same-file/same-file-1.0.2.crate
    ref: cfb6eded0b06a0b512c8ddbcf04089138c9b4362c2f696f3c3d76039d68f3637
  - kind: crate
    url: https://static.crates.io/crates/schannel/schannel-0.1.11.crate
    ref: fbaffce35eb61c5b00846e73128b0cd62717e7c0ec46abbec132370d013975b4
  - kind: crate
    url: https://static.crates.io/crates/scoped-tls/scoped-tls-0.1.1.crate
    ref: 8674d439c964889e2476f474a3bf198cc9e199e77499960893bac5de7e9218a4
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
    url: https://static.crates.io/crates/serde/serde-1.0.37.crate
    ref: d3bcee660dcde8f52c3765dd9ca5ee36b4bf35470a738eb0bd5a8752b0389645
  - kind: crate
    url: https://static.crates.io/crates/serde_derive/serde_derive-1.0.37.crate
    ref: f1711ab8b208541fa8de00425f6a577d90f27bb60724d2bb5fd911314af9668f
  - kind: crate
    url: https://static.crates.io/crates/serde_derive_internals/serde_derive_internals-0.23.0.crate
    ref: 89b340a48245bc03ddba31d0ff1709c118df90edc6adabaca4aac77aea181cce
  - kind: crate
    url: https://static.crates.io/crates/serde_ignored/serde_ignored-0.0.4.crate
    ref: 190e9765dcedb56be63b6e0993a006c7e3b071a016a304736e4a315dc01fb142
  - kind: crate
    url: https://static.crates.io/crates/serde_json/serde_json-1.0.13.crate
    ref: 5c508584d9913df116b91505eec55610a2f5b16e9ed793c46e4d0152872b3e74
  - kind: crate
    url: https://static.crates.io/crates/shell-escape/shell-escape-0.1.4.crate
    ref: 170a13e64f2a51b77a45702ba77287f5c6829375b04a69cf2222acd17d0cfab9
  - kind: crate
    url: https://static.crates.io/crates/socket2/socket2-0.3.4.crate
    ref: 71ebbe82fcdd697244ba7fe6e05e63b5c45910c3927e28469a04947494ff48d8
  - kind: crate
    url: https://static.crates.io/crates/strsim/strsim-0.6.0.crate
    ref: b4d15c810519a91cf877e7e36e63fe068815c678181439f2f29e2562147c3694
  - kind: crate
    url: https://static.crates.io/crates/syn/syn-0.11.11.crate
    ref: d3b891b9015c88c576343b9b3e41c2c11a51c219ef067b264bd9c8aa9b441dad
  - kind: crate
    url: https://static.crates.io/crates/syn/syn-0.13.1.crate
    ref: 91b52877572087400e83d24b9178488541e3d535259e04ff17a63df1e5ceff59
  - kind: crate
    url: https://static.crates.io/crates/synom/synom-0.11.3.crate
    ref: a393066ed9010ebaed60b9eafa373d4b1baac186dd7e008555b0f702b51945b6
  - kind: crate
    url: https://static.crates.io/crates/synstructure/synstructure-0.6.1.crate
    ref: 3a761d12e6d8dcb4dcf952a7a89b475e3a9d69e4a69307e01a470977642914bd
  - kind: crate
    url: https://static.crates.io/crates/tar/tar-0.4.14.crate
    ref: 1605d3388ceb50252952ffebab4b5dc43017ead7e4481b175961c283bb951195
  - kind: crate
    url: https://static.crates.io/crates/tempdir/tempdir-0.3.7.crate
    ref: 15f2b5fb00ccdf689e0149d1b1b3c03fead81c2b37735d812fa8bddbbf41b6d8
  - kind: crate
    url: https://static.crates.io/crates/termcolor/termcolor-0.3.6.crate
    ref: adc4587ead41bf016f11af03e55a624c06568b5a19db4e90fde573d805074f83
  - kind: crate
    url: https://static.crates.io/crates/termion/termion-1.5.1.crate
    ref: 689a3bdfaab439fd92bc87df5c4c78417d3cbe537487274e9b0b2dce76e92096
  - kind: crate
    url: https://static.crates.io/crates/thread-id/thread-id-2.0.0.crate
    ref: a9539db560102d1cef46b8b78ce737ff0bb64e7e18d35b2a5688f7d097d0ff03
  - kind: crate
    url: https://static.crates.io/crates/thread_local/thread_local-0.2.7.crate
    ref: 8576dbbfcaef9641452d5cf0df9b0e7eeab7694956dd33bb61515fb8f18cfdd5
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
    url: https://static.crates.io/crates/unicode-normalization/unicode-normalization-0.1.5.crate
    ref: 51ccda9ef9efa3f7ef5d91e8f9b83bbe6955f9bf86aec89d5cce2c874625920f
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
    url: https://static.crates.io/crates/userenv-sys/userenv-sys-0.2.0.crate
    ref: 71d28ea36bbd9192d75bd9fa9b39f96ddb986eaee824adae5d53b6e51919b2f3
  - kind: crate
    url: https://static.crates.io/crates/utf8-ranges/utf8-ranges-0.1.3.crate
    ref: a1ca13c08c41c9c3e04224ed9ff80461d97e121589ff27c753a16cb10830ae0f
  - kind: crate
    url: https://static.crates.io/crates/utf8-ranges/utf8-ranges-1.0.0.crate
    ref: 662fab6525a98beff2921d7f61a39e7d59e0b425ebc7d0d9e66d316e55124122
  - kind: crate
    url: https://static.crates.io/crates/vcpkg/vcpkg-0.2.2.crate
    ref: 9e0a7d8bed3178a8fb112199d466eeca9ed09a14ba8ad67718179b4fd5487d0b
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
    url: https://static.crates.io/crates/winapi/winapi-0.3.4.crate
    ref: 04e3bd221fcbe8a271359c04f21a76db7d0c6028862d1bb5512d85e1e2eb5bb3
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
