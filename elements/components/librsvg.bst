kind: autotools

depends:
- bootstrap-import.bst
- components/gdk-pixbuf.bst
- components/pango.bst
- components/cairo.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/rust.bst
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
  ref: 2.48.9-0-gc412fae7c33c9765a450583b29d41ed83850682e
- kind: cargo
  url: crates:crates
  ref:
  - name: aho-corasick
    version: 0.7.13
    sha: 043164d8ba5c4c3035fec9bbee8647c0261d788f3474306f93bb65901cae0e86
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
    version: 0.2.13
    sha: 31accafdb70df7871592c058eca3985b71104e15ac32f64706022c58867da931
  - name: bumpalo
    version: 3.4.0
    sha: 2e8c087f005730276d1096a652e92a8bacee2e2472bcc9715a74d2bec38b5820
  - name: byteorder
    version: 1.3.4
    sha: 08c48aae112d48ed9f069b33538ea9e3e90aa263cfa3d1c24309612b1f7472de
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
    version: 2.33.1
    sha: bdfa80d47f954d53a35a64987ca1422f495b8d6483c0fe9f7117b36c2a792129
  - name: criterion
    version: 0.3.3
    sha: 70daa7ceec6cf143990669a04c7df13391d55fb27bd4079d252fca774ba244d8
  - name: criterion-plot
    version: 0.4.3
    sha: e022feadec601fba1649cfa83586381a4ad31c6bf3a9ab7d408118b05dd9889d
  - name: crossbeam-deque
    version: 0.7.3
    sha: 9f02af974daeee82218205558e51ec8768b48cf524bd01d550abe5573a608285
  - name: crossbeam-epoch
    version: 0.8.2
    sha: 058ed274caafc1f60c4997b5fc07bf7dc7cca454af7c6e81edffe5f33f70dace
  - name: crossbeam-queue
    version: 0.2.3
    sha: 774ba60a54c213d409d5353bda12d49cd68d14e45036a285234c8d6f91f92570
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
    version: 0.99.9
    sha: 298998b1cf6b5b2c8a7b023dfd45821825ce3ba8a8af55c921a0e734e4653f76
  - name: downcast-rs
    version: 1.2.0
    sha: 9ea835d29036a4087793836fa931b08837ad5e957da9e23886b29586fb9b6650
  - name: dtoa
    version: 0.4.6
    sha: 134951f4028bdadb9b84baf4232681efbf277da25144b9b0ad65df75946c422b
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
  - name: futf
    version: 0.1.4
    sha: 7c9c1ce3fa9336301af935ab852c437817d14cd33690446569392e65170aac3b
  - name: futures-channel
    version: 0.3.5
    sha: f366ad74c28cca6ba456d95e6422883cfb4b252a83bed929c83abfdbbf2967d5
  - name: futures-core
    version: 0.3.5
    sha: 59f5fff90fd5d971f936ad674802482ba441b6f09ba5e15fd8b39145582ca399
  - name: futures-executor
    version: 0.3.5
    sha: 10d6bb888be1153d3abeb9006b11b02cf5e9b209fda28693c31ae1e4e012e314
  - name: futures-io
    version: 0.3.5
    sha: de27142b013a8e869c14957e6d2edeef89e97c289e69d042ee3a49acd8b51789
  - name: futures-macro
    version: 0.3.5
    sha: d0b5a30a4328ab5473878237c447333c093297bded83a4983d10f4deea240d39
  - name: futures-task
    version: 0.3.5
    sha: bdb66b5f09e22019b1ab0830f7785bcea8e7a42148683f99214f73f8ec21a626
  - name: futures-util
    version: 0.3.5
    sha: 8764574ff08b701a084482c3c7031349104b07ac897393010494beaa18ce32c6
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
  - name: half
    version: 1.6.0
    sha: d36fab90f82edc3c747f9d438e06cf0a491055896f2a279638bb5beed6c40177
  - name: hermit-abi
    version: 0.1.14
    sha: b9586eedd4ce6b3c498bc3b4dd92fc9f11166aa908a914071953768066c67909
  - name: idna
    version: 0.2.0
    sha: 02e2673c30ee86b5b96a9cb52ad15718aa1f966f5ab9ad54a8b95d5ca33120a9
  - name: itertools
    version: 0.8.2
    sha: f56a2d0bc861f9165be4eb3442afd3c236d8a98afd426f65d92324ae1091a484
  - name: itertools
    version: 0.9.0
    sha: 284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b
  - name: itoa
    version: 0.4.6
    sha: dc6f3ad7b9d11a0c00842ff8de1b60ee58661048eb8049ed33c73594f359d7e6
  - name: js-sys
    version: 0.3.41
    sha: c4b9172132a62451e56142bff9afc91c8e4a4500aa5b847da36815b63bfda916
  - name: language-tags
    version: 0.2.2
    sha: a91d884b6667cd606bb5a69aa0c99ba811a115fc68915e7056ec08a46e93199a
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.71
    sha: 9457b06509d27052635f90d6466700c65095fdf75409b3fbdd903e988b886f49
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
    version: 0.5.5
    sha: c198b026e1bbf08a937e94c6c60f9ec4a2267f5b0d2eec9c1b21b061ce2be55f
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
    version: 0.1.43
    sha: 8d59457e662d541ba17869cf51cf177c0b5f0cbf476c66bdc90bf1edac4f875b
  - name: num-rational
    version: 0.2.4
    sha: 5c000134b5dbf44adc5cb772486d335293351644b801551abe8f75c84cfa4aef
  - name: num-traits
    version: 0.2.12
    sha: ac267bcc07f48ee5f8935ab0d24f316fb722d7a1292e2913f0cc196b29ffd611
  - name: num_cpus
    version: 1.13.0
    sha: 05499f3756671c15885fee9034446956fff3f243d6077b91e5767df161f766b3
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
    version: 1.4.0
    sha: 0b631f7e854af39a1739f401cf34a8a013dfe09eac4fa4dba91e9768bd28168d
  - name: oorandom
    version: 11.1.2
    sha: a170cebd8021a008ea92e4db85a72f80b35df514ec664b296fdcbb654eac0b2c
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
  - name: pin-project
    version: 0.4.22
    sha: 12e3a6cdbfe94a5e4572812a0201f8c0ed98c1c452c7b8563ce2276988ef9c17
  - name: pin-project-internal
    version: 0.4.22
    sha: 6a0ffd45cf79d88737d7cc85bfd5d2894bee1139b356e616fe85dc389c61aaf7
  - name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - name: pkg-config
    version: 0.3.17
    sha: 05da548ad6865900e60eaba7f589cc0783590a92e940c26953ff81ddbab2d677
  - name: plotters
    version: 0.2.15
    sha: 0d1685fbe7beba33de0330629da9d955ac75bd54f33d7b79f9a895590124f6bb
  - name: ppv-lite86
    version: 0.2.8
    sha: 237a5ed80e274dbc66f86bd59c1e25edc039660be53194b5fe0a482e0f2612ea
  - name: precomputed-hash
    version: 0.1.1
    sha: 925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c
  - name: proc-macro-hack
    version: 0.5.16
    sha: 7e0456befd48169b9f13ef0f0ad46d492cf9d2dbb918bcf38e01eed4ce3ec5e4
  - name: proc-macro-nested
    version: 0.1.6
    sha: eba180dafb9038b050a4c280019bbedf9f2467b61e5d892dcad585bb57aadc5a
  - name: proc-macro2
    version: 1.0.18
    sha: beae6331a816b1f65d04c45b078fd8e6c93e8071771f41b8163255bbd8d7c8fa
  - name: quote
    version: 1.0.7
    sha: aa563d17ecb180e500da1cfd2b028310ac758de548efdd203e18f283af693f37
  - name: rand
    version: 0.7.3
    sha: 6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03
  - name: rand_chacha
    version: 0.2.2
    sha: f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402
  - name: rand_core
    version: 0.5.1
    sha: 90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19
  - name: rand_distr
    version: 0.2.2
    sha: 96977acbdd3a6576fb1d27391900035bf3863d4a16422973a409b488cf29ffb2
  - name: rand_hc
    version: 0.2.0
    sha: ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c
  - name: rand_pcg
    version: 0.2.1
    sha: 16abd0c1b639e9eb4d7c50c0b8100b0d0f849be2349829c740fe8e6eb4816429
  - name: rawpointer
    version: 0.2.1
    sha: 60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3
  - name: rayon
    version: 1.3.1
    sha: 62f02856753d04e03e26929f820d0a0a337ebe71f849801eea335d464b349080
  - name: rayon-core
    version: 1.7.1
    sha: e92e15d89083484e11353891f1af602cc661426deb9564c298b270c726973280
  - name: rctree
    version: 0.3.3
    sha: be9e29cb19c8fe84169fcb07f8f11e66bc9e6e0280efd4715c54818296f8a4a8
  - name: regex
    version: 1.3.9
    sha: 9c3780fcf44b193bc4d09f36d2a3c87b251da4a046c87795a0d35f4f927ad8e6
  - name: regex-automata
    version: 0.1.9
    sha: ae1ded71d66a4a97f5e961fd0cb25a5f366a42a41570d16a763a69c092c26ae4
  - name: regex-syntax
    version: 0.6.18
    sha: 26412eb97c6b088a6997e05f69403a802a92d520de2f8e63c2b65f9e0f47c4e8
  - name: rgb
    version: 0.8.18
    sha: 6714061b32e0b0527005d5874c28a57d905559fecfacd361462ad0b01e701996
  - name: rustc_version
    version: 0.2.3
    sha: 138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a
  - name: ryu
    version: 1.0.5
    sha: 71d301d4193d031abdd79ff7e3dd721168a9572ef3fe51a1517aba235bd8f86e
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
    version: 1.0.114
    sha: 5317f7588f0a5078ee60ef675ef96735a1442132dc645eb1d12c018620ed8cd3
  - name: serde_cbor
    version: 0.11.1
    sha: 1e18acfa2f90e8b735b2836ab8d538de304cbb6729a7360729ea5a895d15a622
  - name: serde_derive
    version: 1.0.114
    sha: 2a0be94b04690fbaed37cddffc5c134bf537c8e3329d53e982fe04c374978f8e
  - name: serde_json
    version: 1.0.56
    sha: 3433e879a558dde8b5e8feb2a04899cf34fdde1fafb894687e52105fc1162ac3
  - name: servo_arc
    version: 0.1.1
    sha: d98238b800e0d1576d8b6e3de32827c2d74bee68bb97748dcf5071fb53965432
  - name: siphasher
    version: 0.3.3
    sha: fa8f3741c7372e75519bd9346068370c9cdaabcc1f9599cbcf2a2719352286b7
  - name: slab
    version: 0.4.2
    sha: c111b5bd5695e56cffe5129854aa230b39c93a305372fdbb2668ca2394eea9f8
  - name: smallvec
    version: 1.4.0
    sha: c7cb5678e1615754284ec264d9bb5b4c27d2018577fd90ac0ceb578591ed5ee4
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
    version: 1.0.33
    sha: e8d5d96e8cbb005d6959f119f773bfaebb5684296108fb32600c00cde305b2cd
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
  - name: time
    version: 0.1.43
    sha: ca8a50ef2360fbd1eeb0ecd46795a87a19024eb4b53c5dc916ca1fd95fe62438
  - name: tinytemplate
    version: 1.1.0
    sha: 6d3dc76004a03cec1c5932bca4cdc2e39aaa798e3f82363dd94f9adf6098c12f
  - name: tinyvec
    version: 0.3.3
    sha: 53953d2d3a5ad81d9f844a32f14ebb121f50b650cd59d0ee2a07cf13c617efed
  - name: typenum
    version: 1.12.0
    sha: 373c8a200f9e67a0c95e62a4f52fbf80c23b4381c05a17845531982fa99e6b33
  - name: unicode-bidi
    version: 0.3.4
    sha: 49f2bd0c6468a8230e1db229cff8029217cf623c767ea5d60bfbd42729ea54d5
  - name: unicode-normalization
    version: 0.1.13
    sha: 6fb19cf769fa8c6a80a162df694621ebeb4dafb606470b2b2fce0be40a98a977
  - name: unicode-width
    version: 0.1.8
    sha: 9337591893a19b88d8d87f2cec1e73fad5cdfd10e5a6f349f498ad6ea2ffb1e3
  - name: unicode-xid
    version: 0.2.1
    sha: f7fe0bb3479651439c9112f72b6c505038574c9fbb575ed1bf3b797fa39dd564
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
  - name: wasm-bindgen
    version: 0.2.64
    sha: 6a634620115e4a229108b71bde263bb4220c483b3f07f5ba514ee8d15064c4c2
  - name: wasm-bindgen-backend
    version: 0.2.64
    sha: 3e53963b583d18a5aa3aaae4b4c1cb535218246131ba22a71f05b518098571df
  - name: wasm-bindgen-macro
    version: 0.2.64
    sha: 3fcfd5ef6eec85623b4c6e844293d4516470d8f19cd72d0d12246017eb9060b8
  - name: wasm-bindgen-macro-support
    version: 0.2.64
    sha: 9adff9ee0e94b926ca81b57f57f86d5545cdcb1d259e21ec9bdd95b901754c75
  - name: wasm-bindgen-shared
    version: 0.2.64
    sha: 7f7b90ea6c632dd06fd765d44542e234d5e63d9bb917ecd64d79778a13bd79ae
  - name: web-sys
    version: 0.3.41
    sha: 863539788676619aac1a23e2df3655e96b32b0e05eb72ca34ba045ad573c625d
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.5
    sha: 70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: xml5ever
    version: 0.16.1
    sha: 0b1b52e6e8614d4a58b8e70cf51ec0cc21b256ad8206708bcff8139b5bbd6a59
