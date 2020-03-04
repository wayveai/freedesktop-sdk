kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: extensions/rust/rust.bst
  type: build
- filename: components/vala.bst
  type: build
- filename: components/gdk-pixbuf.bst
- filename: components/pango.bst
- filename: components/cairo.bst
- filename: components/libcroco.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gtk-doc.bst
  type: build
- filename: components/gobject-introspection.bst
  type: build

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
  - librsvg-2.44
  exclude:
  - '*.*[13579].*'
  ref: 2.46.0-0-gb4aa8d277d30f4042797dc8b64c073b10f8bac4b
- kind: cargo
  url: crates:crates
  ref:
  - name: aho-corasick
    version: 0.7.6
    sha: 58fb5e95d83b38284460a5fda7d6470aa0b8844d283a0b614b8535e880800d2d
  - name: alga
    version: 0.9.1
    sha: d708cb68c7106ed1844de68f50f0157a7788c2909a6926fad5a87546ef6a4ff8
  - name: approx
    version: 0.3.2
    sha: f0e60b75072ecd4168020818c0107f2857bb6c4e64252d8d3983f6263b40a5c3
  - name: arrayvec
    version: 0.4.11
    sha: b8d73f9beda665eaa98ab9e4f7442bd4e7de6652587de55b2525e52e29c1b0ba
  - name: atty
    version: 0.2.13
    sha: 1803c647a3ec87095e7ae7acfca019e98de5ec9a7d01343f611cf3152ed71a90
  - name: autocfg
    version: 0.1.6
    sha: b671c8fb71b457dd4ae18c4ba1e59aa81793daacc361d82fcd410cef0d491875
  - name: bitflags
    version: 1.1.0
    sha: 3d155346769a6855b86399e9bc3814ab343cd3d62c7e985113d46a0ec3c281fd
  - name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - name: bstr
    version: 0.2.8
    sha: 8d6c2c5b58ab920a4f5aeaaca34b4488074e8cc7596af94e6f8c6ff247c60245
  - name: byteorder
    version: 1.3.2
    sha: a7c3dd8985a7111efc5c80b44e23ecdd8c007de8ade3b96595387e812b957cf5
  - name: cairo-rs
    version: 0.7.1
    sha: e05db47de3b0f09a222fa4bba2eab957d920d4243962a86b2d77ab401e4a359c
  - name: cairo-sys-rs
    version: 0.9.0
    sha: 90a1ec04603a78c111886a385edcec396dbfbc57ea26b9e74aeea6a1fe55dcca
  - name: cast
    version: 0.2.2
    sha: 926013f2860c46252efceabb19f4a6b308197505082c609025aa6706c011d427
  - name: cfg-if
    version: 0.1.9
    sha: b486ce3ccf7ffd79fdeb678eac06a9e6c09fc88d33836340becb8fffe87c5e33
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
    version: 0.7.1
    sha: b18cd2e169ad86297e6bc0ad9aa679aee9daa4f19e8163860faf7c164e4f5a71
  - name: crossbeam-epoch
    version: 0.7.2
    sha: fedcd6772e37f3da2a9af9bf12ebe046c0dfe657992377b4df982a2b54cd37a9
  - name: crossbeam-queue
    version: 0.1.2
    sha: 7c979cd6cfe72335896575c6b5688da489e420d36a27a0b9eb0c73db574b4a4b
  - name: crossbeam-utils
    version: 0.6.6
    sha: 04973fa96e96579258a5091af6003abde64af786b860f18622b82e026cca60e6
  - name: cssparser
    version: 0.25.9
    sha: fbe18ca4efb9ba3716c6da66cc3d7e673bf59fa576353011f48c4cfddbdd740e
  - name: cssparser-macros
    version: 0.3.6
    sha: 5bb1c84e87c717666564ec056105052331431803d606bd45529b28547b611eef
  - name: csv
    version: 1.1.1
    sha: 37519ccdfd73a75821cac9319d4fce15a81b9fcf75f951df5b9988aa3a0af87d
  - name: csv-core
    version: 0.1.6
    sha: 9b5cadb6b25c77aeff80ba701712494213f4a8418fcda2ee11b6560c3ad0bf4c
  - name: data-url
    version: 0.1.0
    sha: d33fe99ccedd6e84bc035f1931bb2e6be79739d6242bd895e7311c886c50dc9c
  - name: downcast-rs
    version: 1.0.4
    sha: f2b92dfd5c2f75260cbf750572f95d387e7ca0ba5e3fbe9e1a33f23025be020f
  - name: dtoa
    version: 0.4.4
    sha: ea57b42383d091c85abcc2706240b94ab2a8fa1fc81c10ff23c4de06e2a90b5e
  - name: dtoa-short
    version: 0.3.2
    sha: 59020b8513b76630c49d918c33db9f4c91638e7d3404a28084083b87e33f76f2
  - name: either
    version: 1.5.2
    sha: 5527cfe0d098f36e3f8839852688e63c8fff1c90b2b405aef730615f9a7bcf7b
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
    version: 0.5.2
    sha: 7ef4eee449a2818084dad09f4fcd6e6e8932c482d8d94298493226782bb45b5e
  - name: fragile
    version: 0.3.0
    sha: 05f8140122fa0d5dcb9fc8627cfce2b37cc1500f752636d46ea28bc26785c2f9
  - name: fuchsia-cprng
    version: 0.1.1
    sha: a06f77d526c1a601b7c4cdd98f54b5eaabffc14d5f2f0296febdc7f357c6d3ba
  - name: futf
    version: 0.1.4
    sha: 7c9c1ce3fa9336301af935ab852c437817d14cd33690446569392e65170aac3b
  - name: gdk-pixbuf
    version: 0.7.0
    sha: 9726408ee1bbada83094326a99b9c68fea275f9dbb515de242a69e72051f4fcc
  - name: gdk-pixbuf-sys
    version: 0.9.0
    sha: b1d6778abf5764b9080a9345a16c5d16289426a3b3edd808a29a9061d431c465
  - name: generic-array
    version: 0.12.3
    sha: c68f0274ae0e023facc3c97b2e00f076be70e254bc851d972503b328db79b2ec
  - name: gio
    version: 0.7.0
    sha: 6261b5d34c30c2d59f879e643704cf54cb44731f3a2038000b68790c03e360e3
  - name: gio-sys
    version: 0.9.0
    sha: 778b856a70a32e2cc5dd5cc7fa1b0c4b6df924fdf5c82984bc28f30565657cfe
  - name: glib
    version: 0.8.1
    sha: 91a70db179515473b57aaff8b879167f1f8460bc5523e97beacf6d1026a8b99d
  - name: glib-sys
    version: 0.9.0
    sha: 4b86a9169fbc9cf9a0ef315039c2304b09d5c575c5fde7defba3576a0311b863
  - name: gobject-sys
    version: 0.9.0
    sha: 61d55bc9202447ca776f6ad0048c36e3312010f66f82ab478e97513e93f3604b
  - name: idna
    version: 0.2.0
    sha: 02e2673c30ee86b5b96a9cb52ad15718aa1f966f5ab9ad54a8b95d5ca33120a9
  - name: itertools
    version: 0.8.0
    sha: 5b8467d9c1cebe26feb08c640139247fac215782d35371ade9a2136ed6085358
  - name: itoa
    version: 0.4.4
    sha: 501266b7edd0174f8530248f87f99c88fbe60ca4ef3dd486835b8d8d53136f7f
  - name: language-tags
    version: 0.2.2
    sha: a91d884b6667cd606bb5a69aa0c99ba811a115fc68915e7056ec08a46e93199a
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.62
    sha: 34fcd2c08d2f832f376f4173a231990fa5aef4e99fb569867318a227ef4c06ba
  - name: libm
    version: 0.1.4
    sha: 7fc7aa29613bd6a620df431842069224d8bc9011086b1db4c0e0cd47fa03ec9a
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
    version: 0.9.0
    sha: 65381d9d47506b8592b97c4efd936afcf673b09b059f2bef39c7211ee78b9d03
  - name: matches
    version: 0.1.8
    sha: 7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08
  - name: matrixmultiply
    version: 0.2.2
    sha: dcfed72d871629daa12b25af198f110e8095d7650f5f4c61c5bac28364604f9b
  - name: memchr
    version: 2.2.1
    sha: 88579771288728879b57485cc7d6b07d648c9f0141eb955f8ab7f9d45394468e
  - name: memoffset
    version: 0.5.1
    sha: ce6075db033bbbb7ee5a0bbd3a3186bbae616f57fb001c485c7ff77955f8177f
  - name: nalgebra
    version: 0.18.1
    sha: aaa9fddbc34c8c35dd2108515587b8ce0cab396f17977b8c738568e4edb521a2
  - name: new_debug_unreachable
    version: 1.0.3
    sha: f40f005c60db6e03bae699e414c58bf9aa7ea02a2d0b9bfbcf19286cc4c82b30
  - name: nodrop
    version: 0.1.13
    sha: 2f9667ddcc6cc8a43afc9b7917599d7216aa09c463919ea32c59ed6cac8bc945
  - name: num-complex
    version: 0.2.3
    sha: fcb0cf31fb3ff77e6d2a6ebd6800df7fdcd106f2ad89113c9130bcd07f93dffc
  - name: num-integer
    version: 0.1.41
    sha: b85e541ef8255f6cf42bbfe4ef361305c6c135d10919ecc26126c4e5ae94bc09
  - name: num-rational
    version: 0.2.2
    sha: f2885278d5fe2adc2f75ced642d52d879bffaceb5a2e0b1d4309ffdfb239b454
  - name: num-traits
    version: 0.2.8
    sha: 6ba9a427cfca2be13aa6f6403b0b7e7368fe982bfa16fccc450ce74c46cd9b32
  - name: num_cpus
    version: 1.10.1
    sha: bcef43580c035376c0705c42792c294b66974abbfd2789b511784023f71f3273
  - name: objc
    version: 0.2.6
    sha: 31d20fd2b37e07cf5125be68357b588672e8cefe9a96f8c17a9d46053b3e590d
  - name: objc-foundation
    version: 0.1.1
    sha: 1add1b659e36c9607c7aab864a76c7a4c2760cd0cd2e120f3fb8b952c7e22bf9
  - name: objc_id
    version: 0.1.1
    sha: c92d4ddb4bd7b50d730c215ff871754d0da6b2178849f8a2a2ab69712d0c073b
  - name: pango
    version: 0.7.0
    sha: 393fa071b144f8ffb83ede273758983cf414ca3c0b1d2a5a9ce325b3ba3dd786
  - name: pango-sys
    version: 0.9.0
    sha: 1ee97abcad820f9875e032656257ad1c790e7b11a0e6ce2516a8f5b0d8f8213f
  - name: pangocairo
    version: 0.8.0
    sha: 7486695787f206924b662cb8ca7b3c987fdbbff4ccff3612017cf471aee65162
  - name: pangocairo-sys
    version: 0.10.0
    sha: bd3ef177ef222904c6cafd94ddca16db24e6287089b796dd9912f99a139006e3
  - name: percent-encoding
    version: 2.1.0
    sha: d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e
  - name: phf
    version: 0.7.24
    sha: b3da44b85f8e8dfaec21adae67f95d93244b2ecf6ad2a692320598dcc8e6dd18
  - name: phf_codegen
    version: 0.7.24
    sha: b03e85129e324ad4166b06b2c7491ae27fe3ec353af72e72cd1654c7225d517e
  - name: phf_generator
    version: 0.7.24
    sha: 09364cc93c159b8b06b1f4dd8a4398984503483891b0c26b867cf431fb132662
  - name: phf_shared
    version: 0.7.24
    sha: 234f71a15de2288bcb7e3b6515828d22af7ec8598ee6d24c3b526fa0a80b67a0
  - name: pkg-config
    version: 0.3.16
    sha: 72d5370d90f49f70bd033c3d75e87fc529fbfff9d6f7cccef07d6170079d91ea
  - name: precomputed-hash
    version: 0.1.1
    sha: 925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c
  - name: proc-macro2
    version: 0.4.30
    sha: cf3d2011ab5c909338f7887f4fc896d35932e29146c12c8d01da6b22a80ba759
  - name: proc-macro2
    version: 1.0.3
    sha: e98a83a9f9b331f54b924e68a66acb1bb35cb01fb0a23645139967abefb697e8
  - name: procedural-masquerade
    version: 0.1.6
    sha: 9a1574a51c3fd37b26d2c0032b649d08a7d51d4cca9c41bbc5bf7118fa4509d0
  - name: quote
    version: 0.6.13
    sha: 6ce23b6b870e8f94f81fb0a363d65d86675884b34a09043c81e5562f11c1f8e1
  - name: quote
    version: 1.0.2
    sha: 053a8c8bcc71fcce321828dc897a98ab9760bef03a4fc36693c231e5b3216cfe
  - name: rand
    version: 0.6.5
    sha: 6d71dacdc3c88c1fde3885a3be3fbab9f35724e6ce99467f7d9c5026132184ca
  - name: rand_chacha
    version: 0.1.1
    sha: 556d3a1ca6600bfcbab7c7c91ccb085ac7fbbcd70e008a98742e7847f4f7bcef
  - name: rand_core
    version: 0.3.1
    sha: 7a6fdeb83b075e8266dcc8762c22776f6877a63111121f5f8c7411e5be7eed4b
  - name: rand_core
    version: 0.4.2
    sha: 9c33a3c44ca05fa6f1807d8e6743f3824e8509beca625669633be0acbdf509dc
  - name: rand_hc
    version: 0.1.0
    sha: 7b40677c7be09ae76218dc623efbf7b18e34bced3f38883af07bb75630a21bc4
  - name: rand_isaac
    version: 0.1.1
    sha: ded997c9d5f13925be2a6fd7e66bf1872597f759fd9dd93513dd7e92e5a5ee08
  - name: rand_jitter
    version: 0.1.4
    sha: 1166d5c91dc97b88d1decc3285bb0a99ed84b05cfd0bc2341bdf2d43fc41e39b
  - name: rand_os
    version: 0.1.3
    sha: 7b75f676a1e053fc562eafbb47838d67c84801e38fc1ba459e8f180deabd5071
  - name: rand_pcg
    version: 0.1.2
    sha: abf9b09b01790cfe0364f52bf32995ea3c39f4d2dd011eac241d2914146d0b44
  - name: rand_xorshift
    version: 0.1.1
    sha: cbf7e9e623549b0e21f6e97cf8ecf247c1a8fd2e8a992ae265314300b2455d5c
  - name: rand_xoshiro
    version: 0.1.0
    sha: 03b418169fb9c46533f326efd6eed2576699c44ca92d3052a066214a8d828929
  - name: rawpointer
    version: 0.1.0
    sha: ebac11a9d2e11f2af219b8b8d833b76b1ea0e054aa0e8d8e9e4cbde353bdf019
  - name: rayon
    version: 1.2.0
    sha: 83a27732a533a1be0a0035a111fe76db89ad312f6f0347004c220c57f209a123
  - name: rayon-core
    version: 1.6.0
    sha: 98dcf634205083b17d0861252431eb2acbfb698ab7478a2d20de07954f47ec7b
  - name: rctree
    version: 0.3.3
    sha: be9e29cb19c8fe84169fcb07f8f11e66bc9e6e0280efd4715c54818296f8a4a8
  - name: rdrand
    version: 0.4.0
    sha: 678054eb77286b51581ba43620cc911abf02758c91f93f479767aed0f90458b2
  - name: regex
    version: 1.3.1
    sha: dc220bd33bdce8f093101afe22a037b8eb0e5af33592e6a9caafff0d4cb81cbd
  - name: regex-automata
    version: 0.1.8
    sha: 92b73c2a1770c255c240eaa4ee600df1704a38dc3feaa6e949e7fcd4f8dc09f9
  - name: regex-syntax
    version: 0.6.12
    sha: 11a7e20d1cce64ef2fed88b66d347f88bd9babb82845b2b858f3edbf59a4f716
  - name: rustc_version
    version: 0.2.3
    sha: 138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a
  - name: ryu
    version: 1.0.0
    sha: c92464b447c0ee8c4fb3824ecc8383b81717b9f1e74ba2e72540aef7b9f82997
  - name: same-file
    version: 1.0.5
    sha: 585e8ddcedc187886a30fa705c47985c3fa88d06624095856b36ca0b82ff4421
  - name: scopeguard
    version: 1.0.0
    sha: b42e15e59b18a828bbf5c58ea01debb36b9b096346de35d941dcb89009f24a0d
  - name: semver
    version: 0.9.0
    sha: 1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403
  - name: semver-parser
    version: 0.7.0
    sha: 388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3
  - name: serde
    version: 1.0.100
    sha: f4473e8506b213730ff2061073b48fa51dcc66349219e2e7c5608f0296a1d95a
  - name: serde_derive
    version: 1.0.100
    sha: 11e410fde43e157d789fc290d26bc940778ad0fdd47836426fbac36573710dbb
  - name: serde_json
    version: 1.0.40
    sha: 051c49229f282f7c6f3813f8286cc1e3323e8051823fce42c7ea80fe13521704
  - name: siphasher
    version: 0.2.3
    sha: 0b8de496cf83d4ed58b6be86c3a275b8602f6ffe98d3024a869e124147a9a3ac
  - name: smallvec
    version: 0.6.10
    sha: ab606a9c5e214920bb66c458cd7be8ef094f813f20fe77a54cc7dbfff220d4b7
  - name: string_cache
    version: 0.7.3
    sha: 25d70109977172b127fe834e5449e5ab1740b9ba49fa18a2020f509174f25423
  - name: string_cache_codegen
    version: 0.4.2
    sha: 1eea1eee654ef80933142157fdad9dd8bc43cf7c74e999e369263496f04ff4da
  - name: string_cache_shared
    version: 0.3.0
    sha: b1884d1bc09741d466d9b14e6d37ac89d6909cbcac41dd9ae982d4d063bbedfc
  - name: syn
    version: 1.0.5
    sha: 66850e97125af79138385e9b88339cbcd037e3f28ceab8c5ad98e64f0f1f80bf
  - name: tendril
    version: 0.4.1
    sha: 707feda9f2582d5d680d733e38755547a3e8fb471e7ba11452ecfd9ce93a5d3b
  - name: textwrap
    version: 0.11.0
    sha: d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060
  - name: thread_local
    version: 0.3.6
    sha: c6b53e329000edc2b34dbe8545fd20e55a333362d0a321909685a19bd28c3f1b
  - name: tinytemplate
    version: 1.0.2
    sha: 4574b75faccaacddb9b284faecdf0b544b80b6b294f3d062d325c5726a209c20
  - name: typenum
    version: 1.11.2
    sha: 6d2783fe2d6b8c1101136184eb41be8b1ad379e4657050b8aaff0c79ee7575f9
  - name: unicode-bidi
    version: 0.3.4
    sha: 49f2bd0c6468a8230e1db229cff8029217cf623c767ea5d60bfbd42729ea54d5
  - name: unicode-normalization
    version: 0.1.8
    sha: 141339a08b982d942be2ca06ff8b076563cbe223d1befd5450716790d44e2426
  - name: unicode-width
    version: 0.1.6
    sha: 7007dbd421b92cc6e28410fe7362e2e0a2503394908f417b68ec8d1c364c4e20
  - name: unicode-xid
    version: 0.1.0
    sha: fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc
  - name: unicode-xid
    version: 0.2.0
    sha: 826e7639553986605ec5979c7dd957c7895e93eabed50ab2ffa7f6128a75097c
  - name: url
    version: 2.1.0
    sha: 75b414f6c464c879d7f9babf951f23bc3743fb7313c081b2e6ca719067ea9d61
  - name: utf-8
    version: 0.7.5
    sha: 05e42f7c18b8f902290b009cde6d651262f956c98bc51bca4cd1d511c9cd85c7
  - name: walkdir
    version: 2.2.9
    sha: 9658c94fa8b940eab2250bd5a457f9c48b748420d71293b165c8cdbe2f55f71e
  - name: winapi
    version: 0.3.8
    sha: 8093091eeb260906a183e6ae1abdba2ef5ef2257a21801128899c3fc699229c6
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.2
    sha: 7168bab6e1daee33b4557efd0e95d5ca70a03706d39fa5f3fe7a236f584b03c9
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: xml-rs
    version: 0.8.0
    sha: 541b12c998c5b56aa2b4e6f18f03664eef9a4fd0a246a55594efae6cc2d964b5
