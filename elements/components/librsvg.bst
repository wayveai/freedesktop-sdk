kind: autotools

depends:
- bootstrap-import.bst
- components/gdk-pixbuf.bst
- components/pango.bst
- components/cairo.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- extensions/rust/rust.bst
- components/vala.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst

variables:
  conf-local: |
    --enable-gtk-doc \
    --enable-vala

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/librsvg-2.so'

environment:
  PATH: /usr/bin:/usr/lib/sdk/rust/bin

sources:
- kind: git_tag
  url: gnome:librsvg.git
  track: master
  track-extra:
  - librsvg-2.48
  exclude:
  - '*.*[13579].*'
  ref: 2.48.0-0-gcc3b2fb0672052721e761ca9dd1c8ab6821cbdf9
- kind: cargo
  url: crates:crates
  ref:
  - name: aho-corasick
    version: 0.7.9
    sha: d5e63fd144e18ba274ae7095c0197a870a7b9468abc801dd62f190d80817d2ec
  - name: alga
    version: 0.9.3
    sha: 4f823d037a7ec6ea2197046bafd4ae150e6bc36f9ca347404f46a46823fa84f2
  - name: approx
    version: 0.3.2
    sha: f0e60b75072ecd4168020818c0107f2857bb6c4e64252d8d3983f6263b40a5c3
  - name: atty
    version: 0.2.14
    sha: d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8
  - name: autocfg
    version: 1.0.0
    sha: f8aac770f1885fd7e387acedd76065302551364496e46b3dd00860b2f8359b9d
  - name: bitflags
    version: 1.2.1
    sha: cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693
  - name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - name: bstr
    version: 0.2.11
    sha: 502ae1441a0a5adb8fbd38a5955a6416b9493e92b465de5e4a9bde6a539c2c48
  - name: byteorder
    version: 1.3.4
    sha: 08c48aae112d48ed9f069b33538ea9e3e90aa263cfa3d1c24309612b1f7472de
  - name: c2-chacha
    version: 0.2.3
    sha: 214238caa1bf3a496ec3392968969cab8549f96ff30652c9e56885329315f6bb
  - name: cairo-rs
    version: 0.8.1
    sha: 157049ba9618aa3a61c39d5d785102c04d3b1f40632a706c621a9aedc21e6084
  - name: cairo-sys-rs
    version: 0.9.2
    sha: ff65ba02cac715be836f63429ab00a767d48336efc5497c5637afb53b4f14d63
  - name: cast
    version: 0.2.3
    sha: 4b9434b9a5aa1450faa3f9cb14ea0e8c53bb5d2b3c1bfd1ab4fc03e9f33fbfb0
  - name: cfg-if
    version: 0.1.10
    sha: 4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822
  - name: clap
    version: 2.33.0
    sha: 5067f5bb2d80ef5d68b4c87db81601f0b75bca627bc2ef76b141d7b846a3c6d9
  - name: cloudabi
    version: 0.0.3
    sha: ddfc5b9aa5d4507acaf872de71051dfd0e309860e88966e1051e462a077aac4f
  - name: criterion
    version: 0.2.11
    sha: 0363053954f3e679645fc443321ca128b7b950a6fe288cf5f9335cc22ee58394
  - name: criterion-plot
    version: 0.3.1
    sha: 76f9212ddf2f4a9eb2d401635190600656a1f88a932ef53d06e7fa4c7e02fb8e
  - name: crossbeam-deque
    version: 0.7.3
    sha: 9f02af974daeee82218205558e51ec8768b48cf524bd01d550abe5573a608285
  - name: crossbeam-epoch
    version: 0.8.2
    sha: 058ed274caafc1f60c4997b5fc07bf7dc7cca454af7c6e81edffe5f33f70dace
  - name: crossbeam-queue
    version: 0.2.1
    sha: c695eeca1e7173472a32221542ae469b3e9aac3a4fc81f7696bcad82029493db
  - name: crossbeam-utils
    version: 0.7.2
    sha: c3c7c73a2d1e9fc0886a08b93e98eb643461230d5f1925e4036204d5f2e261a8
  - name: cssparser
    version: 0.27.2
    sha: 754b69d351cdc2d8ee09ae203db831e005560fc6030da058f86ad60c92a9cb0a
  - name: cssparser-macros
    version: 0.6.0
    sha: dfae75de57f2b2e85e8768c3ea840fd159c8f33e2b6522c7835b7abac81be16e
  - name: csv
    version: 1.1.3
    sha: 00affe7f6ab566df61b4be3ce8cf16bc2576bca0963ceb0955e45d514bf9a279
  - name: csv-core
    version: 0.1.10
    sha: 2b2466559f260f48ad25fe6317b3c8dac77b5bdb5763ac7d9d6103530663bc90
  - name: data-url
    version: 0.1.0
    sha: d33fe99ccedd6e84bc035f1931bb2e6be79739d6242bd895e7311c886c50dc9c
  - name: derive_more
    version: 0.99.3
    sha: a806e96c59a76a5ba6e18735b6cf833344671e61e7863f2edb5c518ea2cac95c
  - name: downcast-rs
    version: 1.1.1
    sha: 52ba6eb47c2131e784a38b726eb54c1e1484904f013e576a25354d0124161af6
  - name: dtoa
    version: 0.4.5
    sha: 4358a9e11b9a09cf52383b451b49a169e8d797b68aa02301ff586d70d9661ea3
  - name: dtoa-short
    version: 0.3.2
    sha: 59020b8513b76630c49d918c33db9f4c91638e7d3404a28084083b87e33f76f2
  - name: either
    version: 1.5.3
    sha: bb1f6b1ce1c140482ea30ddd3335fc0024ac7ee112895426e0a629a6c20adfe3
  - name: encoding
    version: 0.2.33
    sha: 6b0d943856b990d12d3b55b359144ff341533e516d94098b1d3fc1ac666d36ec
  - name: encoding-index-japanese
    version: 1.20141219.5
    sha: 04e8b2ff42e9a05335dbf8b5c6f7567e5591d0d916ccef4e0b1710d32a0d0c91
  - name: encoding-index-korean
    version: 1.20141219.5
    sha: 4dc33fb8e6bcba213fe2f14275f0963fd16f0a02c878e3095ecfdf5bee529d81
  - name: encoding-index-simpchinese
    version: 1.20141219.5
    sha: d87a7194909b9118fc707194baa434a4e3b0fb6a5a757c73c3adb07aa25031f7
  - name: encoding-index-singlebyte
    version: 1.20141219.5
    sha: 3351d5acffb224af9ca265f435b859c7c01537c0849754d3db3fdf2bfe2ae84a
  - name: encoding-index-tradchinese
    version: 1.20141219.5
    sha: fd0e20d5688ce3cab59eb3ef3a2083a5c77bf496cb798dc6fcdb75f323890c18
  - name: encoding_index_tests
    version: 0.1.4
    sha: a246d82be1c9d791c5dfde9a2bd045fc3cbba3fa2b11ad558f27d01712f00569
  - name: float-cmp
    version: 0.6.0
    sha: da62c4f1b81918835a8c6a484a397775fff5953fe83529afd51b05f5c6a6617d
  - name: fuchsia-cprng
    version: 0.1.1
    sha: a06f77d526c1a601b7c4cdd98f54b5eaabffc14d5f2f0296febdc7f357c6d3ba
  - name: futf
    version: 0.1.4
    sha: 7c9c1ce3fa9336301af935ab852c437817d14cd33690446569392e65170aac3b
  - name: futures-channel
    version: 0.3.4
    sha: f0c77d04ce8edd9cb903932b608268b3fffec4163dc053b3b402bf47eac1f1a8
  - name: futures-core
    version: 0.3.4
    sha: f25592f769825e89b92358db00d26f965761e094951ac44d3663ef25b7ac464a
  - name: futures-executor
    version: 0.3.4
    sha: f674f3e1bcb15b37284a90cedf55afdba482ab061c407a9c0ebbd0f3109741ba
  - name: futures-io
    version: 0.3.4
    sha: a638959aa96152c7a4cddf50fcb1e3fede0583b27157c26e67d6f99904090dc6
  - name: futures-macro
    version: 0.3.4
    sha: 9a5081aa3de1f7542a794a397cde100ed903b0630152d0973479018fd85423a7
  - name: futures-task
    version: 0.3.4
    sha: 7b0a34e53cf6cdcd0178aa573aed466b646eb3db769570841fda0c7ede375a27
  - name: futures-util
    version: 0.3.4
    sha: 22766cf25d64306bedf0384da004d05c9974ab104fcc4528f1236181c18004c5
  - name: fxhash
    version: 0.2.1
    sha: c31b6d751ae2c7f11320402d34e41349dd1016f8d5d45e48c4312bc8625af50c
  - name: gdk-pixbuf
    version: 0.8.0
    sha: e248220c46b329b097d4b158d2717f8c688f16dd76d0399ace82b3e98062bdd7
  - name: gdk-pixbuf-sys
    version: 0.9.1
    sha: d8991b060a9e9161bafd09bf4a202e6fd404f5b4dd1a08d53a1e84256fb34ab0
  - name: generic-array
    version: 0.13.2
    sha: 0ed1e761351b56f54eb9dcd0cfaca9fd0daecf93918e1cfc01c8a3d26ee7adcd
  - name: getrandom
    version: 0.1.14
    sha: 7abc8dd8451921606d809ba32e95b6111925cd2906060d2dcc29c070220503eb
  - name: gio
    version: 0.8.1
    sha: 0cd10f9415cce39b53f8024bf39a21f84f8157afa52da53837b102e585a296a5
  - name: gio-sys
    version: 0.9.1
    sha: 4fad225242b9eae7ec8a063bb86974aca56885014672375e5775dc0ea3533911
  - name: glib
    version: 0.9.3
    sha: 40fb573a09841b6386ddf15fd4bc6655b4f5b106ca962f57ecaecde32a0061c0
  - name: glib-sys
    version: 0.9.1
    sha: 95856f3802f446c05feffa5e24859fe6a183a7cb849c8449afc35c86b1e316e2
  - name: gobject-sys
    version: 0.9.1
    sha: 31d1a804f62034eccf370006ccaef3708a71c31d561fee88564abe71177553d9
  - name: hermit-abi
    version: 0.1.8
    sha: 1010591b26bbfe835e9faeabeb11866061cc7dcebffd56ad7d0942d0e61aefd8
  - name: idna
    version: 0.2.0
    sha: 02e2673c30ee86b5b96a9cb52ad15718aa1f966f5ab9ad54a8b95d5ca33120a9
  - name: itertools
    version: 0.8.2
    sha: f56a2d0bc861f9165be4eb3442afd3c236d8a98afd426f65d92324ae1091a484
  - name: itoa
    version: 0.4.5
    sha: b8b7a7c0c47db5545ed3fef7468ee7bb5b74691498139e4b3f6a20685dc6dd8e
  - name: language-tags
    version: 0.2.2
    sha: a91d884b6667cd606bb5a69aa0c99ba811a115fc68915e7056ec08a46e93199a
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.67
    sha: eb147597cdf94ed43ab7a9038716637d2d1bf2bc571da995d0028dec06bd3018
  - name: libm
    version: 0.2.1
    sha: c7d73b3f436185384286bd8098d17ec07c9a7d2388a6599f824d8502b529702a
  - name: locale_config
    version: 0.3.0
    sha: 08d2c35b16f4483f6c26f0e4e9550717a2f6575bcd6f12a53ff0c490a94a6934
  - name: log
    version: 0.4.8
    sha: 14b6052be84e6b71ab17edffc2eeabf5c2c3ae1fdb464aae35ac50c67a44e1f7
  - name: mac
    version: 0.1.1
    sha: c41e0c4fef86961ac6d6f8a82609f55f31b05e4fce149ac5710e439df7619ba4
  - name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
  - name: markup5ever
    version: 0.10.0
    sha: aae38d669396ca9b707bfc3db254bc382ddb94f57cc5c235f34623a669a01dab
  - name: matches
    version: 0.1.8
    sha: 7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08
  - name: matrixmultiply
    version: 0.2.3
    sha: d4f7ec66360130972f34830bfad9ef05c6610a43938a467bcc9ab9369ab3478f
  - name: maybe-uninit
    version: 2.0.0
    sha: 60302e4db3a61da70c0cb7991976248362f30319e88850c487b9b95bbf059e00
  - name: memchr
    version: 2.3.3
    sha: 3728d817d99e5ac407411fa471ff9800a778d88a24685968b36824eaf4bee400
  - name: memoffset
    version: 0.5.3
    sha: 75189eb85871ea5c2e2c15abbdd541185f63b408415e5051f5cac122d8c774b9
  - name: nalgebra
    version: 0.19.0
    sha: 0abb021006c01b126a936a8dd1351e0720d83995f4fc942d0d426c654f990745
  - name: new_debug_unreachable
    version: 1.0.4
    sha: e4a24736216ec316047a1fc4252e27dabb04218aa4a3f37c6e7ddbf1f9782b54
  - name: nodrop
    version: 0.1.14
    sha: 72ef4a56884ca558e5ddb05a1d1e7e1bfd9a68d9ed024c21704cc98872dae1bb
  - name: num-complex
    version: 0.2.4
    sha: b6b19411a9719e753aff12e5187b74d60d3dc449ec3f4dc21e3989c3f554bc95
  - name: num-integer
    version: 0.1.42
    sha: 3f6ea62e9d81a77cd3ee9a2a5b9b609447857f3d358704331e4ef39eb247fcba
  - name: num-rational
    version: 0.2.3
    sha: da4dc79f9e6c81bef96148c8f6b8e72ad4541caa4a24373e900a36da07de03a3
  - name: num-traits
    version: 0.2.11
    sha: c62be47e61d1842b9170f0fdeec8eba98e60e90e5446449a0545e5152acd7096
  - name: num_cpus
    version: 1.12.0
    sha: 46203554f085ff89c235cd12f7075f3233af9b11ed7c9e16dfe2560d03313ce6
  - name: objc
    version: 0.2.7
    sha: 915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1
  - name: objc-foundation
    version: 0.1.1
    sha: 1add1b659e36c9607c7aab864a76c7a4c2760cd0cd2e120f3fb8b952c7e22bf9
  - name: objc_id
    version: 0.1.1
    sha: c92d4ddb4bd7b50d730c215ff871754d0da6b2178849f8a2a2ab69712d0c073b
  - name: once_cell
    version: 1.3.1
    sha: b1c601810575c99596d4afc46f78a678c80105117c379eb3650cf99b8a21ce5b
  - name: pango
    version: 0.8.0
    sha: 1e9c6b728f1be8edb5f9f981420b651d5ea30bdb9de89f1f1262d0084a020577
  - name: pango-sys
    version: 0.9.1
    sha: 86b93d84907b3cf0819bff8f13598ba72843bee579d5ebc2502e4b0367b4be7d
  - name: pangocairo
    version: 0.9.0
    sha: bdd1077c0db2e5eb9225cc040514aa856cb6a4c4890c542cf50d37880e1c572d
  - name: pangocairo-sys
    version: 0.10.1
    sha: a3921b31ab776b23e28c8f6e474dda52fdc28bc2689101caeb362ba976719efe
  - name: percent-encoding
    version: 2.1.0
    sha: d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e
  - name: phf
    version: 0.8.0
    sha: 3dfb61232e34fcb633f43d12c58f83c1df82962dcdfa565a4e866ffc17dafe12
  - name: phf_codegen
    version: 0.8.0
    sha: cbffee61585b0411840d3ece935cce9cb6321f01c45477d30066498cd5e1a815
  - name: phf_generator
    version: 0.8.0
    sha: 17367f0cc86f2d25802b2c26ee58a7b23faeccf78a396094c13dced0d0182526
  - name: phf_macros
    version: 0.8.0
    sha: 7f6fde18ff429ffc8fe78e2bf7f8b7a5a5a6e2a8b58bc5a9ac69198bbda9189c
  - name: phf_shared
    version: 0.8.0
    sha: c00cf8b9eafe68dde5e9eaa2cef8ee84a9336a47d566ec55ca16589633b65af7
  - name: pin-utils
    version: 0.1.0-alpha.4
    sha: 5894c618ce612a3fa23881b152b608bafb8c56cfc22f434a3ba3120b40f7b587
  - name: pkg-config
    version: 0.3.17
    sha: 05da548ad6865900e60eaba7f589cc0783590a92e940c26953ff81ddbab2d677
  - name: ppv-lite86
    version: 0.2.6
    sha: 74490b50b9fbe561ac330df47c08f3f33073d2d00c150f719147d7c54522fa1b
  - name: precomputed-hash
    version: 0.1.1
    sha: 925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c
  - name: proc-macro-hack
    version: 0.5.11
    sha: ecd45702f76d6d3c75a80564378ae228a85f0b59d2f3ed43c91b4a69eb2ebfc5
  - name: proc-macro-nested
    version: 0.1.3
    sha: 369a6ed065f249a159e06c45752c780bda2fb53c995718f9e484d08daa9eb42e
  - name: proc-macro2
    version: 1.0.9
    sha: 6c09721c6781493a2a492a96b5a5bf19b65917fe6728884e7c44dd0c60ca3435
  - name: quote
    version: 1.0.3
    sha: 2bdc6c187c65bca4260c9011c9e3132efe4909da44726bad24cf7572ae338d7f
  - name: rand
    version: 0.7.3
    sha: 6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03
  - name: rand_chacha
    version: 0.2.1
    sha: 03a2a90da8c7523f554344f921aa97283eadf6ac484a6d2a7d0212fa7f8d6853
  - name: rand_core
    version: 0.3.1
    sha: 7a6fdeb83b075e8266dcc8762c22776f6877a63111121f5f8c7411e5be7eed4b
  - name: rand_core
    version: 0.4.2
    sha: 9c33a3c44ca05fa6f1807d8e6743f3824e8509beca625669633be0acbdf509dc
  - name: rand_core
    version: 0.5.1
    sha: 90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19
  - name: rand_distr
    version: 0.2.2
    sha: 96977acbdd3a6576fb1d27391900035bf3863d4a16422973a409b488cf29ffb2
  - name: rand_hc
    version: 0.2.0
    sha: ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c
  - name: rand_os
    version: 0.1.3
    sha: 7b75f676a1e053fc562eafbb47838d67c84801e38fc1ba459e8f180deabd5071
  - name: rand_pcg
    version: 0.2.1
    sha: 16abd0c1b639e9eb4d7c50c0b8100b0d0f849be2349829c740fe8e6eb4816429
  - name: rand_xoshiro
    version: 0.1.0
    sha: 03b418169fb9c46533f326efd6eed2576699c44ca92d3052a066214a8d828929
  - name: rawpointer
    version: 0.2.1
    sha: 60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3
  - name: rayon
    version: 1.3.0
    sha: db6ce3297f9c85e16621bb8cca38a06779ffc31bb8184e1be4bed2be4678a098
  - name: rayon-core
    version: 1.7.0
    sha: 08a89b46efaf957e52b18062fb2f4660f8b8a4dde1807ca002690868ef2c85a9
  - name: rctree
    version: 0.3.3
    sha: be9e29cb19c8fe84169fcb07f8f11e66bc9e6e0280efd4715c54818296f8a4a8
  - name: rdrand
    version: 0.4.0
    sha: 678054eb77286b51581ba43620cc911abf02758c91f93f479767aed0f90458b2
  - name: regex
    version: 1.3.4
    sha: 322cf97724bea3ee221b78fe25ac9c46114ebb51747ad5babd51a2fc6a8235a8
  - name: regex-automata
    version: 0.1.8
    sha: 92b73c2a1770c255c240eaa4ee600df1704a38dc3feaa6e949e7fcd4f8dc09f9
  - name: regex-syntax
    version: 0.6.16
    sha: 1132f845907680735a84409c3bebc64d1364a5683ffbce899550cd09d5eaefc1
  - name: rustc_version
    version: 0.2.3
    sha: 138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a
  - name: ryu
    version: 1.0.2
    sha: bfa8506c1de11c9c4e4c38863ccbe02a305c8188e85a05a784c9e11e1c3910c8
  - name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: selectors
    version: 0.22.0
    sha: df320f1889ac4ba6bc0cdc9c9af7af4bd64bb927bccdf32d81140dc1f9be12fe
  - name: semver
    version: 0.9.0
    sha: 1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403
  - name: semver-parser
    version: 0.7.0
    sha: 388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3
  - name: serde
    version: 1.0.104
    sha: 414115f25f818d7dfccec8ee535d76949ae78584fc4f79a6f45a904bf8ab4449
  - name: serde_derive
    version: 1.0.104
    sha: 128f9e303a5a29922045a830221b8f78ec74a5f544944f3d5984f8ec3895ef64
  - name: serde_json
    version: 1.0.48
    sha: 9371ade75d4c2d6cb154141b9752cf3781ec9c05e0e5cf35060e1e70ee7b9c25
  - name: servo_arc
    version: 0.1.1
    sha: d98238b800e0d1576d8b6e3de32827c2d74bee68bb97748dcf5071fb53965432
  - name: siphasher
    version: 0.3.1
    sha: 83da420ee8d1a89e640d0948c646c1c088758d3a3c538f943bfa97bdac17929d
  - name: slab
    version: 0.4.2
    sha: c111b5bd5695e56cffe5129854aa230b39c93a305372fdbb2668ca2394eea9f8
  - name: smallvec
    version: 1.2.0
    sha: 5c2fb2ec9bcd216a5b0d0ccf31ab17b5ed1d627960edff65bbe95d3ce221cefc
  - name: stable_deref_trait
    version: 1.1.1
    sha: dba1a27d3efae4351c8051072d619e3ade2820635c3958d826bfea39d59b54c8
  - name: string_cache
    version: 0.8.0
    sha: 2940c75beb4e3bf3a494cef919a747a2cb81e52571e212bfbd185074add7208a
  - name: string_cache_codegen
    version: 0.5.1
    sha: f24c8e5e19d22a726626f1a5e16fe15b132dcf21d10177fa5a45ce7962996b97
  - name: syn
    version: 1.0.16
    sha: 123bd9499cfb380418d509322d7a6d52e5315f064fe4b3ad18a53d6b92c07859
  - name: tendril
    version: 0.4.1
    sha: 707feda9f2582d5d680d733e38755547a3e8fb471e7ba11452ecfd9ce93a5d3b
  - name: textwrap
    version: 0.11.0
    sha: d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060
  - name: thin-slice
    version: 0.1.1
    sha: 8eaa81235c7058867fa8c0e7314f33dcce9c215f535d1913822a2b3f5e289f3c
  - name: thread_local
    version: 1.0.1
    sha: d40c6d1b69745a6ec6fb1ca717914848da4b44ae29d9b3080cbee91d72a69b14
  - name: tinytemplate
    version: 1.0.3
    sha: 57a3c6667d3e65eb1bc3aed6fd14011c6cbc3a0665218ab7f5daf040b9ec371a
  - name: typenum
    version: 1.11.2
    sha: 6d2783fe2d6b8c1101136184eb41be8b1ad379e4657050b8aaff0c79ee7575f9
  - name: unicode-bidi
    version: 0.3.4
    sha: 49f2bd0c6468a8230e1db229cff8029217cf623c767ea5d60bfbd42729ea54d5
  - name: unicode-normalization
    version: 0.1.12
    sha: 5479532badd04e128284890390c1e876ef7a993d0570b3597ae43dfa1d59afa4
  - name: unicode-width
    version: 0.1.7
    sha: caaa9d531767d1ff2150b9332433f32a24622147e5ebb1f26409d5da67afd479
  - name: unicode-xid
    version: 0.2.0
    sha: 826e7639553986605ec5979c7dd957c7895e93eabed50ab2ffa7f6128a75097c
  - name: url
    version: 2.1.1
    sha: 829d4a8476c35c9bf0bbce5a3b23f4106f79728039b726d292bb93bc106787cb
  - name: utf-8
    version: 0.7.5
    sha: 05e42f7c18b8f902290b009cde6d651262f956c98bc51bca4cd1d511c9cd85c7
  - name: walkdir
    version: 2.3.1
    sha: 777182bc735b6424e1a57516d35ed72cb8019d85c8c9bf536dccb3445c1a2f7d
  - name: wasi
    version: 0.9.0+wasi-snapshot-preview1
    sha: cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519
  - name: winapi
    version: 0.3.8
    sha: 8093091eeb260906a183e6ae1abdba2ef5ef2257a21801128899c3fc699229c6
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.3
    sha: 4ccfbf554c6ad11084fb7517daca16cfdcaccbdadba4fc336f032a8b12c2ad80
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: xml-rs
    version: 0.8.0
    sha: 541b12c998c5b56aa2b4e6f18f03664eef9a4fd0a246a55594efae6cc2d964b5
