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
  track: main
  track-extra:
  - librsvg-2.48
  exclude:
  - '*.*[13579].*'
  ref: 2.52.5-0-g756616b808ce63ef09036f37952409b88b471522
- kind: cargo
  url: crates:crates
  ref:
  - name: adler
    version: 1.0.2
    sha: f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe
  - name: adler32
    version: 1.2.0
    sha: aae1277d39aeec15cb388266ecc24b11c80469deae6067e17a1a7aa9e5c1f234
  - name: aho-corasick
    version: 0.7.18
    sha: 1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f
  - name: ansi_term
    version: 0.12.1
    sha: d52a9bb7ec0cf484c551830a7ce27bd20d67eac647e1befb56b0be4ee39a55d2
  - name: anyhow
    version: 1.0.51
    sha: 8b26702f315f53b6071259e15dd9d64528213b44d61de1ec926eca7715d62203
  - name: approx
    version: 0.5.0
    sha: 072df7202e63b127ab55acfe16ce97013d5b97bf160489336d3f1840fd78e99e
  - name: assert_cmd
    version: 2.0.2
    sha: e996dc7940838b7ef1096b882e29ec30a3149a3a443cdc8dba19ed382eca1fe2
  - name: atty
    version: 0.2.14
    sha: d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8
  - name: autocfg
    version: 1.0.1
    sha: cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a
  - name: base-x
    version: 0.2.8
    sha: a4521f3e3d031370679b3b140beb36dfe4801b09ac77e30c61941f97df3ef28b
  - name: bit-set
    version: 0.5.2
    sha: 6e11e16035ea35e4e5997b393eacbf6f63983188f7a2ad25bfb13465f5ad59de
  - name: bit-vec
    version: 0.6.3
    sha: 349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - name: bstr
    version: 0.2.17
    sha: ba3569f383e8f1598449f1a423e72e99569137b47740b1da11ef19af3d5c3223
  - name: bumpalo
    version: 3.8.0
    sha: 8f1e260c3a9040a7c19a12468758f4c16f31a81a1fe087482be9570ec864bb6c
  - name: bytemuck
    version: 1.7.3
    sha: 439989e6b8c38d1b6570a384ef1e49c8848128f5a97f3914baef02920842712f
  - name: byteorder
    version: 1.4.3
    sha: 14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610
  - name: cairo-rs
    version: 0.14.9
    sha: 33b5725979db0c586d98abad2193cdb612dd40ef95cd26bd99851bf93b3cb482
  - name: cairo-sys-rs
    version: 0.14.9
    sha: b448b876970834fda82ba3aeaccadbd760206b75388fc5c1b02f1e343b697570
  - name: cast
    version: 0.2.7
    sha: 4c24dab4283a142afa2fdca129b80ad2c6284e073930f964c3a1293c225ee39a
  - name: cast
    version: 0.3.0
    sha: 37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5
  - name: cfg-expr
    version: 0.8.1
    sha: b412e83326147c2bb881f8b40edfbf9905b9b8abaebd0e47ca190ba62fda8f0e
  - name: cfg-expr
    version: 0.9.0
    sha: edae0b9625d1fce32f7d64b71784d9b1bf8469ec1a9c417e44aaf16a9cbd7571
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: chrono
    version: 0.4.19
    sha: 670ad68c9088c2a963aaa298cb369688cf3f9465ce5e2d4ca10e6e0098a1ce73
  - name: clap
    version: 2.34.0
    sha: a0610544180c38b88101fecf2dd634b174a62eef6946f84dfc6a7127512b381c
  - name: const-cstr
    version: 0.3.0
    sha: ed3d0b5ff30645a68f35ece8cea4556ca14ef8a1651455f789a099a0513532a6
  - name: const_fn
    version: 0.4.8
    sha: f92cfa0fd5690b3cf8c1ef2cabbd9b7ef22fa53cf5e1f92b05103f6d5d1cf6e7
  - name: convert_case
    version: 0.4.0
    sha: 6245d59a3e82a7fc217c5828a6692dbc6dfb63a0c8c90495621f7b9d79704a0e
  - name: crc32fast
    version: 1.3.0
    sha: 738c290dfaea84fc1ca15ad9c168d083b05a714e1efddd8edaab678dc28d2836
  - name: criterion
    version: 0.3.5
    sha: 1604dafd25fba2fe2d5895a9da139f8dc9b319a5fe5354ca137cbbce4e178d10
  - name: criterion-plot
    version: 0.4.4
    sha: d00996de9f2f7559f7f4dc286073197f83e92256a59ed395f9aac01fe717da57
  - name: crossbeam-channel
    version: 0.5.1
    sha: 06ed27e177f16d65f0f0c22a213e17c696ace5dd64b14258b52f9417ccb52db4
  - name: crossbeam-deque
    version: 0.8.1
    sha: 6455c0ca19f0d2fbf751b908d5c55c1f5cbc65e03c4225427254b46890bdde1e
  - name: crossbeam-epoch
    version: 0.9.5
    sha: 4ec02e091aa634e2c3ada4a392989e7c3116673ef0ac5b72232439094d73b7fd
  - name: crossbeam-utils
    version: 0.8.5
    sha: d82cfc11ce7f2c3faef78d8a684447b40d503d9681acebed6cb728d45940c4db
  - name: cssparser
    version: 0.28.1
    sha: 1db8599a9761b371751fbf13e076fa03c6e1a78f8c5288e6ab9467f10a2322c1
  - name: cssparser-macros
    version: 0.6.0
    sha: dfae75de57f2b2e85e8768c3ea840fd159c8f33e2b6522c7835b7abac81be16e
  - name: csv
    version: 1.1.6
    sha: 22813a6dc45b335f9bade10bf7271dc477e81113e89eb251a0bc2a8a81c536e1
  - name: csv-core
    version: 0.1.10
    sha: 2b2466559f260f48ad25fe6317b3c8dac77b5bdb5763ac7d9d6103530663bc90
  - name: data-url
    version: 0.1.1
    sha: 3a30bfce702bcfa94e906ef82421f2c0e61c076ad76030c16ee5d2e9a32fe193
  - name: deflate
    version: 0.9.1
    sha: 5f95bf05dffba6e6cce8dfbb30def788154949ccd9aed761b472119c21e01c70
  - name: derive_more
    version: 0.99.17
    sha: 4fb810d30a7c1953f91334de7244731fc3f3c10d7fe163338a35b9f640960321
  - name: difflib
    version: 0.4.0
    sha: 6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8
  - name: discard
    version: 1.0.4
    sha: 212d0f5754cb6769937f4501cc0e67f4f4483c8d2c3e1e922ee9edbe4ab4c7c0
  - name: doc-comment
    version: 0.3.3
    sha: fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10
  - name: dtoa
    version: 0.4.8
    sha: 56899898ce76aaf4a0f24d914c97ea6ed976d42fec6ad33fcbb0a1103e07b2b0
  - name: dtoa-short
    version: 0.3.3
    sha: bde03329ae10e79ede66c9ce4dc930aa8599043b0743008548680f25b91502d6
  - name: either
    version: 1.6.1
    sha: e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457
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
  - name: flate2
    version: 1.0.22
    sha: 1e6988e897c1c9c485f43b47a529cef42fde0547f9d8d41a7062518f1d8fc53f
  - name: float-cmp
    version: 0.9.0
    sha: 98de4bbd547a563b716d8dfa9aad1cb19bfab00f4fa09a6a4ed21dbcf44ce9c4
  - name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - name: form_urlencoded
    version: 1.0.1
    sha: 5fc25a87fa4fd2094bffb06925852034d90a17f0d1e05197d4956d3555752191
  - name: futf
    version: 0.1.4
    sha: 7c9c1ce3fa9336301af935ab852c437817d14cd33690446569392e65170aac3b
  - name: futures-channel
    version: 0.3.17
    sha: 5da6ba8c3bb3c165d3c7319fc1cc8304facf1fb8db99c5de877183c08a273888
  - name: futures-core
    version: 0.3.17
    sha: 88d1c26957f23603395cd326b0ffe64124b818f4449552f960d815cfba83a53d
  - name: futures-executor
    version: 0.3.17
    sha: 45025be030969d763025784f7f355043dc6bc74093e4ecc5000ca4dc50d8745c
  - name: futures-io
    version: 0.3.17
    sha: 522de2a0fe3e380f1bc577ba0474108faf3f6b18321dbf60b3b9c39a75073377
  - name: futures-task
    version: 0.3.17
    sha: 1d3d00f4eddb73e498a54394f228cd55853bdf059259e8e7bc6e69d408892e99
  - name: futures-util
    version: 0.3.17
    sha: 36568465210a3a6ee45e1f165136d68671471a501e632e9a98d96872222b5481
  - name: fxhash
    version: 0.2.1
    sha: c31b6d751ae2c7f11320402d34e41349dd1016f8d5d45e48c4312bc8625af50c
  - name: gdk-pixbuf
    version: 0.14.0
    sha: 534192cb8f01daeb8fab2c8d4baa8f9aae5b7a39130525779f5c2608e235b10f
  - name: gdk-pixbuf-sys
    version: 0.14.0
    sha: f097c0704201fbc8f69c1762dc58c6947c8bb188b8ed0bc7e65259f1894fe590
  - name: getrandom
    version: 0.1.16
    sha: 8fc3cb4d91f53b50155bdcfd23f6a4c39ae1969c2ae85982b135750cccaf5fce
  - name: getrandom
    version: 0.2.3
    sha: 7fcd999463524c52659517fe2cea98493cfe485d10565e7b0fb07dbba7ad2753
  - name: gio
    version: 0.14.8
    sha: 711c3632b3ebd095578a9c091418d10fed492da9443f58ebc8f45efbeb215cb0
  - name: gio-sys
    version: 0.14.0
    sha: c0a41df66e57fcc287c4bcf74fc26b884f31901ea9792ec75607289b456f48fa
  - name: glib
    version: 0.14.8
    sha: 7c515f1e62bf151ef6635f528d05b02c11506de986e43b34a5c920ef0b3796a4
  - name: glib-macros
    version: 0.14.1
    sha: 2aad66361f66796bfc73f530c51ef123970eb895ffba991a234fcf7bea89e518
  - name: glib-sys
    version: 0.14.0
    sha: 1c1d60554a212445e2a858e42a0e48cece1bd57b311a19a9468f70376cf554ae
  - name: glob
    version: 0.3.0
    sha: 9b919933a397b79c37e33b77bb2aa3dc8eb6e165ad809e58ff75bc7db2e34574
  - name: gobject-sys
    version: 0.14.0
    sha: aa92cae29759dae34ab5921d73fff5ad54b3d794ab842c117e36cafc7994c3f5
  - name: half
    version: 1.8.2
    sha: eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7
  - name: heck
    version: 0.3.3
    sha: 6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c
  - name: hermit-abi
    version: 0.1.19
    sha: 62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33
  - name: idna
    version: 0.2.3
    sha: 418a0a6fab821475f634efe3ccc45c013f742efe03d853e8d3355d5cb850ecf8
  - name: instant
    version: 0.1.12
    sha: 7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c
  - name: itertools
    version: 0.10.3
    sha: a9a9d19fa1e79b6215ff29b9d6880b706147f16e9b1dbb1e4e5947b5b02bc5e3
  - name: itoa
    version: 0.4.8
    sha: b71991ff56294aa922b450139ee08b3bfc70982c6b2c7562771375cf73542dd4
  - name: itoa
    version: 1.0.1
    sha: 1aab8fc367588b89dcee83ab0fd66b72b50b72fa1904d7095045ace2b0c81c35
  - name: js-sys
    version: 0.3.55
    sha: 7cc9ffccd38c451a86bf13657df244e9c3f37493cce8e5e21e940963777acc84
  - name: language-tags
    version: 0.3.2
    sha: d4345964bb142484797b161f473a503a434de77149dd8c7427788c6e13379388
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.112
    sha: 1b03d17f364a3a042d5e5d46b053bbbf82c92c9430c592dd4c064dc6ee997125
  - name: linked-hash-map
    version: 0.5.4
    sha: 7fb9b38af92608140b86b693604b9ffcc5824240a484d1ecd4795bacb2fe88f3
  - name: locale_config
    version: 0.3.0
    sha: 08d2c35b16f4483f6c26f0e4e9550717a2f6575bcd6f12a53ff0c490a94a6934
  - name: lock_api
    version: 0.4.5
    sha: 712a4d093c9976e24e7dbca41db895dabcbac38eb5f4045393d17a95bdfb1109
  - name: log
    version: 0.4.14
    sha: 51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710
  - name: lopdf
    version: 0.26.0
    sha: b49a0272112719d0037ab63d4bb67f73ba659e1e90bc38f235f163a457ac16f3
  - name: lzw
    version: 0.10.0
    sha: 7d947cbb889ed21c2a84be6ffbaebf5b4e0f4340638cba0444907e38b56be084
  - name: mac
    version: 0.1.1
    sha: c41e0c4fef86961ac6d6f8a82609f55f31b05e4fce149ac5710e439df7619ba4
  - name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
  - name: markup5ever
    version: 0.10.1
    sha: a24f40fb03852d1cdd84330cddcaf98e9ec08a7b7768e952fad3b4cf048ec8fd
  - name: matches
    version: 0.1.9
    sha: a3e378b66a060d48947b590737b30a1be76706c8dd7b8ba0f2fe3989c68a853f
  - name: matrixmultiply
    version: 0.3.2
    sha: add85d4dd35074e6fedc608f8c8f513a3548619a9024b751949ef0e8e45a4d84
  - name: memchr
    version: 2.4.1
    sha: 308cc39be01b73d0d18f82a0e7b2a3df85245f84af96fdddc5d202d27e47b86a
  - name: memoffset
    version: 0.6.5
    sha: 5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce
  - name: miniz_oxide
    version: 0.4.4
    sha: a92518e98c078586bc6c934028adcca4c92a53d6a958196de835170a01d84e4b
  - name: nalgebra
    version: 0.29.0
    sha: d506eb7e08d6329505faa8a3a00a5dcc6de9f76e0c77e4b75763ae3c770831ff
  - name: nalgebra-macros
    version: 0.1.0
    sha: 01fcc0b8149b4632adc89ac3b7b31a12fb6099a0317a4eb2ebff574ef7de7218
  - name: new_debug_unreachable
    version: 1.0.4
    sha: e4a24736216ec316047a1fc4252e27dabb04218aa4a3f37c6e7ddbf1f9782b54
  - name: nodrop
    version: 0.1.14
    sha: 72ef4a56884ca558e5ddb05a1d1e7e1bfd9a68d9ed024c21704cc98872dae1bb
  - name: normalize-line-endings
    version: 0.3.0
    sha: 61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be
  - name: num-complex
    version: 0.4.0
    sha: 26873667bbbb7c5182d4a37c1add32cdf09f841af72da53318fdb81543c15085
  - name: num-integer
    version: 0.1.44
    sha: d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a8031bc2801db
  - name: num-rational
    version: 0.4.0
    sha: d41702bd167c2df5520b384281bc111a4b5efcf7fbc4c9c222c815b07e0a6a6a
  - name: num-traits
    version: 0.2.14
    sha: 9a64b1ec5cda2586e284722486d802acf1f7dbdc623e2bfc57e65ca1cd099290
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
    version: 1.9.0
    sha: da32515d9f6e6e489d7bc9d84c71b060db7247dc035bbe44eac88cf87486d8d5
  - name: oorandom
    version: 11.1.3
    sha: 0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575
  - name: pango
    version: 0.14.8
    sha: 546fd59801e5ca735af82839007edd226fe7d3bb06433ec48072be4439c28581
  - name: pango-sys
    version: 0.14.0
    sha: 2367099ca5e761546ba1d501955079f097caa186bb53ce0f718dca99ac1942fe
  - name: pangocairo
    version: 0.14.0
    sha: f03ac1e8d456f8f436168aeac41201f0bf49d1dc6c8d01bfb04de2cca25df631
  - name: pangocairo-sys
    version: 0.14.0
    sha: f3b9b679ad5c8503e3e533ce06e1619d033274b246e977a6fa1655a6c6ef2b51
  - name: parking_lot
    version: 0.11.2
    sha: 7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99
  - name: parking_lot_core
    version: 0.8.5
    sha: d76e8e1493bcac0d2766c42737f34458f1c8c50c0d23bcb24ea953affb273216
  - name: paste
    version: 1.0.6
    sha: 0744126afe1a6dd7f394cb50a716dbe086cb06e255e53d8d0185d82828358fb5
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
  - name: pin-project-lite
    version: 0.2.7
    sha: 8d31d11c69a6b52a174b42bdc0c30e5e11670f90788b2c471c31c1d17d449443
  - name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - name: pkg-config
    version: 0.3.24
    sha: 58893f751c9b0412871a09abd62ecd2a00298c6c83befa223ef98c52aef40cbe
  - name: plotters
    version: 0.3.1
    sha: 32a3fd9ec30b9749ce28cd91f255d569591cdf937fe280c312143e3c4bad6f2a
  - name: plotters-backend
    version: 0.3.2
    sha: d88417318da0eaf0fdcdb51a0ee6c3bed624333bff8f946733049380be67ac1c
  - name: plotters-svg
    version: 0.3.1
    sha: 521fa9638fa597e1dc53e9412a4f9cefb01187ee1f7413076f9e6749e2885ba9
  - name: png
    version: 0.17.2
    sha: c845088517daa61e8a57eee40309347cea13f273694d1385c553e7a57127763b
  - name: pom
    version: 3.2.0
    sha: 07e2192780e9f8e282049ff9bffcaa28171e1cb0844f49ed5374e518ae6024ec
  - name: ppv-lite86
    version: 0.2.15
    sha: ed0cfbc8191465bed66e1718596ee0b0b35d5ee1f41c5df2189d0fe8bde535ba
  - name: precomputed-hash
    version: 0.1.1
    sha: 925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c
  - name: predicates
    version: 2.1.0
    sha: 95e5a7689e456ab905c22c2b48225bb921aba7c8dfa58440d68ba13f6222a715
  - name: predicates-core
    version: 1.0.2
    sha: 57e35a3326b75e49aa85f5dc6ec15b41108cf5aee58eabb1f274dd18b73c2451
  - name: predicates-tree
    version: 1.0.4
    sha: 338c7be2905b732ae3984a2f40032b5e94fd8f52505b186c7d4d68d193445df7
  - name: proc-macro-crate
    version: 1.1.0
    sha: 1ebace6889caf889b4d3f76becee12e90353f2b8c7d875534a71e5742f8f6f83
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
    version: 0.4.30
    sha: cf3d2011ab5c909338f7887f4fc896d35932e29146c12c8d01da6b22a80ba759
  - name: proc-macro2
    version: 1.0.34
    sha: 2f84e92c0f7c9d58328b85a78557813e4bd845130db68d7184635344399423b1
  - name: proptest
    version: 1.0.0
    sha: 1e0d9cc07f18492d879586c92b485def06bc850da3118075cd45d50e9c95b0e5
  - name: quick-error
    version: 1.2.3
    sha: a1d01941d82fa2ab50be1e79e6714289dd7cde78eba4c074bc5a4374f650dfe0
  - name: quick-error
    version: 2.0.1
    sha: a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3
  - name: quote
    version: 0.6.13
    sha: 6ce23b6b870e8f94f81fb0a363d65d86675884b34a09043c81e5562f11c1f8e1
  - name: quote
    version: 1.0.10
    sha: 38bc8cc6a5f2e3655e0899c1b848643b2562f853f114bfec7be120678e3ace05
  - name: rand
    version: 0.7.3
    sha: 6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03
  - name: rand
    version: 0.8.4
    sha: 2e7573632e6454cf6b99d7aac4ccca54be06da05aca2ef7423d22d27d4d4bcd8
  - name: rand_chacha
    version: 0.2.2
    sha: f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402
  - name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - name: rand_core
    version: 0.5.1
    sha: 90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19
  - name: rand_core
    version: 0.6.3
    sha: d34f1408f55294453790c48b2f1ebbb1c5b4b7563eb1f418bcfcfdbb06ebb4e7
  - name: rand_hc
    version: 0.2.0
    sha: ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c
  - name: rand_hc
    version: 0.3.1
    sha: d51e9f596de227fda2ea6c84607f5558e196eeaf43c986b724ba4fb8fdf497e7
  - name: rand_pcg
    version: 0.2.1
    sha: 16abd0c1b639e9eb4d7c50c0b8100b0d0f849be2349829c740fe8e6eb4816429
  - name: rand_xorshift
    version: 0.3.0
    sha: d25bf25ec5ae4a3f1b92f929810509a2f53d7dca2f50b794ff57e3face536c8f
  - name: rawpointer
    version: 0.2.1
    sha: 60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3
  - name: rayon
    version: 1.5.1
    sha: c06aca804d41dbc8ba42dfd964f0d01334eceb64314b9ecf7c5fad5188a06d90
  - name: rayon-core
    version: 1.9.1
    sha: d78120e2c850279833f1dd3582f730c4ab53ed95aeaaaa862a2a5c71b1656d8e
  - name: rctree
    version: 0.4.0
    sha: 9ae028b272a6e99d9f8260ceefa3caa09300a8d6c8d2b2001316474bc52122e9
  - name: redox_syscall
    version: 0.2.10
    sha: 8383f39639269cde97d255a32bdb68c047337295414940c68bdd30c2e13203ff
  - name: regex
    version: 1.5.4
    sha: d07a8629359eb56f1e2fb1652bb04212c072a87ba68546a04065d525673ac461
  - name: regex-automata
    version: 0.1.10
    sha: 6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132
  - name: regex-syntax
    version: 0.6.25
    sha: f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f6153e3cc89b
  - name: remove_dir_all
    version: 0.5.3
    sha: 3acd125665422973a33ac9d3dd2df85edad0f4ae9b00dafb1a05e43a9f5ef8e7
  - name: rgb
    version: 0.8.30
    sha: 08a9852b34c4628f8ad76797a933577059163651ec5a7dace462adc365bee66c
  - name: rustc_version
    version: 0.2.3
    sha: 138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a
  - name: rustc_version
    version: 0.4.0
    sha: bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366
  - name: rusty-fork
    version: 0.3.0
    sha: cb3dcc6e454c328bb824492db107ab7c0ae8fcffe4ad210136ef014458c1bc4f
  - name: ryu
    version: 1.0.9
    sha: 73b4b750c782965c211b42f022f59af1fbceabdd026623714f104152f1ec149f
  - name: safe_arch
    version: 0.6.0
    sha: 794821e4ccb0d9f979512f9c1973480123f9bd62a90d74ab0f9426fcf8f4a529
  - name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: selectors
    version: 0.23.0
    sha: fdea87c686be721aab36607728047801ee21561bfdbd6bf0da7ace2536d5879f
  - name: semver
    version: 0.9.0
    sha: 1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403
  - name: semver
    version: 1.0.4
    sha: 568a8e6258aa33c13358f81fd834adb854c6f7c9468520910a9b1e8fac068012
  - name: semver-parser
    version: 0.7.0
    sha: 388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3
  - name: serde
    version: 1.0.132
    sha: 8b9875c23cf305cd1fd7eb77234cbb705f21ea6a72c637a5c6db5fe4b8e7f008
  - name: serde_cbor
    version: 0.11.2
    sha: 2bef2ebfde456fb76bbcf9f59315333decc4fda0b2b44b420243c11e0f5ec1f5
  - name: serde_derive
    version: 1.0.132
    sha: ecc0db5cb2556c0e558887d9bbdcf6ac4471e83ff66cf696e5419024d1606276
  - name: serde_json
    version: 1.0.73
    sha: bcbd0344bc6533bc7ec56df11d42fb70f1b912351c0825ccb7211b59d8af7cf5
  - name: servo_arc
    version: 0.1.1
    sha: d98238b800e0d1576d8b6e3de32827c2d74bee68bb97748dcf5071fb53965432
  - name: sha1
    version: 0.6.0
    sha: 2579985fda508104f7587689507983eadd6a6e84dd35d6d115361f530916fa0d
  - name: simba
    version: 0.6.0
    sha: f0b7840f121a46d63066ee7a99fc81dcabbc6105e437cae43528cea199b5a05f
  - name: siphasher
    version: 0.3.7
    sha: 533494a8f9b724d33625ab53c6c4800f7cc445895924a8ef649222dcb76e938b
  - name: slab
    version: 0.4.5
    sha: 9def91fd1e018fe007022791f865d0ccc9b3a0d5001e01aabb8b40e46000afb5
  - name: smallvec
    version: 1.7.0
    sha: 1ecab6c735a6bb4139c0caafd0cc3635748bbb3acf4550e8138122099251f309
  - name: stable_deref_trait
    version: 1.2.0
    sha: a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3
  - name: standback
    version: 0.2.17
    sha: e113fb6f3de07a243d434a56ec6f186dfd51cb08448239fe7bcae73f87ff28ff
  - name: stdweb
    version: 0.4.20
    sha: d022496b16281348b52d0e30ae99e01a73d737b2f45d38fed4edf79f9325a1d5
  - name: stdweb-derive
    version: 0.5.3
    sha: c87a60a40fccc84bef0652345bbbbbe20a605bf5d0ce81719fc476f5c03b50ef
  - name: stdweb-internal-macros
    version: 0.2.9
    sha: 58fa5ff6ad0d98d1ffa8cb115892b6e69d67799f6763e162a1c9db421dc22e11
  - name: stdweb-internal-runtime
    version: 0.1.5
    sha: 213701ba3370744dcd1a12960caa4843b3d68b4d1c0a5d575e0d65b2ee9d16c0
  - name: string_cache
    version: 0.8.2
    sha: 923f0f39b6267d37d23ce71ae7235602134b250ace715dd2c90421998ddac0c6
  - name: string_cache_codegen
    version: 0.5.1
    sha: f24c8e5e19d22a726626f1a5e16fe15b132dcf21d10177fa5a45ce7962996b97
  - name: strsim
    version: 0.8.0
    sha: 8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a
  - name: strum
    version: 0.21.0
    sha: aaf86bbcfd1fa9670b7a129f64fc0c9fcbbfe4f1bc4210e9e98fe71ffc12cde2
  - name: strum_macros
    version: 0.21.1
    sha: d06aaeeee809dbc59eb4556183dd927df67db1540de5be8d3ec0b6636358a5ec
  - name: syn
    version: 0.15.44
    sha: 9ca4b3b69a77cbe1ffc9e198781b7acb0c7365a883670e8f1c1bc66fba79a5c5
  - name: syn
    version: 1.0.82
    sha: 8daf5dd0bb60cbd4137b1b587d2fc0ae729bc07cf01cd70b36a1ed5ade3b9d59
  - name: system-deps
    version: 3.2.0
    sha: 480c269f870722b3b08d2f13053ce0c2ab722839f472863c3e2d61ff3a1c2fa6
  - name: system-deps
    version: 6.0.0
    sha: 7b1487aaddaacbc5d60a2a507ba1617c5ca66c57dd0dd07d0c5efd5b693841d4
  - name: tempfile
    version: 3.2.0
    sha: dac1c663cfc93810f88aed9b8941d48cabf856a1b111c29a40439018d870eb22
  - name: tendril
    version: 0.4.2
    sha: a9ef557cb397a4f0a5a3a628f06515f78563f2209e64d47055d9dc6052bf5e33
  - name: termtree
    version: 0.2.3
    sha: 13a4ec180a2de59b57434704ccfad967f789b12737738798fa08798cd5824c16
  - name: test-generator
    version: 0.3.0
    sha: ea97be90349ab3574f6e74d1566e1c5dd3a4bc74b89f4af4cc10ca010af103c0
  - name: textwrap
    version: 0.11.0
    sha: d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060
  - name: thiserror
    version: 1.0.30
    sha: 854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9644e5c417
  - name: thiserror-impl
    version: 1.0.30
    sha: aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d377e5714b
  - name: time
    version: 0.1.43
    sha: ca8a50ef2360fbd1eeb0ecd46795a87a19024eb4b53c5dc916ca1fd95fe62438
  - name: time
    version: 0.2.27
    sha: 4752a97f8eebd6854ff91f1c1824cd6160626ac4bd44287f7f4ea2035a02a242
  - name: time-macros
    version: 0.1.1
    sha: 957e9c6e26f12cb6d0dd7fc776bb67a706312e7299aed74c8dd5b17ebb27e2f1
  - name: time-macros-impl
    version: 0.1.2
    sha: fd3c141a1b43194f3f56a1411225df8646c55781d5f26db825b3d98507eb482f
  - name: tinytemplate
    version: 1.2.1
    sha: be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc
  - name: tinyvec
    version: 1.5.1
    sha: 2c1c1d5a42b6245520c249549ec267180beaffcc0615401ac8e31853d4b6d8d2
  - name: tinyvec_macros
    version: 0.1.0
    sha: cda74da7e1a664f795bb1f8a87ec406fb89a02522cf6e50620d016add6dbbf5c
  - name: toml
    version: 0.5.8
    sha: a31142970826733df8241ef35dc040ef98c679ab14d7c3e54d827099b3acecaa
  - name: typenum
    version: 1.14.0
    sha: b63708a265f51345575b27fe43f9500ad611579e764c79edbc2037b1121959ec
  - name: unicode-bidi
    version: 0.3.7
    sha: 1a01404663e3db436ed2746d9fefef640d868edae3cceb81c3b8d5732fda678f
  - name: unicode-normalization
    version: 0.1.19
    sha: d54590932941a9e9266f0832deed84ebe1bf2e4c9e4a3554d393d18f5e854bf9
  - name: unicode-segmentation
    version: 1.8.0
    sha: 8895849a949e7845e06bd6dc1aa51731a103c42707010a5b591c0038fb73385b
  - name: unicode-width
    version: 0.1.9
    sha: 3ed742d4ea2bd1176e236172c8429aaf54486e7ac098db29ffe6529e0ce50973
  - name: unicode-xid
    version: 0.1.0
    sha: fc72304796d0818e357ead4e000d19c9c174ab23dc11093ac919054d20a6a7fc
  - name: unicode-xid
    version: 0.2.2
    sha: 8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3
  - name: url
    version: 2.2.2
    sha: a507c383b2d33b5fc35d1861e77e6b383d158b2da5e14fe51b83dfedf6fd578c
  - name: utf-8
    version: 0.7.6
    sha: 09cc8ee72d2a9becf2f2febe0205bbed8fc6615b7cb429ad062dc7b7ddd036a9
  - name: vec_map
    version: 0.8.2
    sha: f1bddf1187be692e79c5ffeab891132dfb0f236ed36a43c7ed39f1165ee20191
  - name: version-compare
    version: 0.0.11
    sha: 1c18c859eead79d8b95d09e4678566e8d70105c4e7b251f707a03df32442661b
  - name: version-compare
    version: 0.1.0
    sha: fe88247b92c1df6b6de80ddc290f3976dbdf2f5f5d3fd049a9fb598c6dd5ca73
  - name: version_check
    version: 0.9.3
    sha: 5fecdca9a5291cc2b8dcf7dc02453fee791a280f3743cb0905f8822ae463b3fe
  - name: wait-timeout
    version: 0.2.0
    sha: 9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6
  - name: walkdir
    version: 2.3.2
    sha: 808cf2735cd4b6866113f648b791c6adc5714537bc222d9347bb203386ffda56
  - name: wasi
    version: 0.10.2+wasi-snapshot-preview1
    sha: fd6fbd9a79829dd1ad0cc20627bf1ed606756a7f77edff7b66b7064f9cb327c6
  - name: wasi
    version: 0.9.0+wasi-snapshot-preview1
    sha: cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519
  - name: wasm-bindgen
    version: 0.2.78
    sha: 632f73e236b219150ea279196e54e610f5dbafa5d61786303d4da54f84e47fce
  - name: wasm-bindgen-backend
    version: 0.2.78
    sha: a317bf8f9fba2476b4b2c85ef4c4af8ff39c3c7f0cdfeed4f82c34a880aa837b
  - name: wasm-bindgen-macro
    version: 0.2.78
    sha: d56146e7c495528bf6587663bea13a8eb588d39b36b679d83972e1a2dbbdacf9
  - name: wasm-bindgen-macro-support
    version: 0.2.78
    sha: 7803e0eea25835f8abdc585cd3021b3deb11543c6fe226dcd30b228857c5c5ab
  - name: wasm-bindgen-shared
    version: 0.2.78
    sha: 0237232789cf037d5480773fe568aac745bfe2afbc11a863e97901780a6b47cc
  - name: web-sys
    version: 0.3.55
    sha: 38eb105f1c59d9eaa6b5cdc92b859d85b926e82cb2e0945cd0c9259faa6fe9fb
  - name: wide
    version: 0.7.3
    sha: 476da2f1d225632b1fffe638ff979a4bc03907e29b0ab596efca7624014f8b62
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
    version: 0.16.2
    sha: 9234163818fd8e2418fcde330655e757900d4236acd8cc70fef345ef91f6d865
  - name: yeslogic-fontconfig-sys
    version: 2.11.2
    sha: 38e47154248a2dba5ca6965e26b1a59146210736ea9b862362b6d72682e57f8d
