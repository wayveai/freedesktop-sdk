kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: freedesktop-sdk:releases/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/freedesktop-sdk.gpg
  #
  # FIXME: Change to org.freedesktop.Sdk.PreBootstrap when available
  (?):
  - bootstrap_build_arch == "x86_64":
      track: runtime/org.freedesktop.Sdk.Minimal/x86_64/18.08
      ref: 68048fcee095ccb10c13d5b6f96aa269a37427699d5f81d94f083b1b2ec68caa
  - bootstrap_build_arch == "i686":
      track: runtime/org.freedesktop.Sdk.Minimal/i386/18.08
      ref: a07d06139071bfe3ec7e5a2deacb670e9378e48156be5243ef98edc05a119a9a
  - bootstrap_build_arch == "aarch64":
      track: runtime/org.freedesktop.Sdk.Minimal/aarch64/18.08
      ref: b428a91240419a10b3cace22aafa967b8090112e106d1455959d5865c62a321d
  - bootstrap_build_arch == "arm":
      track: runtime/org.freedesktop.Sdk.Minimal/arm/18.08
      ref: 76f4812b707bf4b6c68a610befecde841a214bf86e8c3637f3cfb4b96057bd37

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
