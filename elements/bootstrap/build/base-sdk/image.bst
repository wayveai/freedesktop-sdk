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
      track: runtime/org.freedesktop.Sdk.PreBootstrap/x86_64/18.08
      ref: ab90a8b25cf86946487e46efd19c80dd6a7ef84e0bd362db1cb41a6240049f74
  - bootstrap_build_arch == "i686":
      track: runtime/org.freedesktop.Sdk.PreBootstrap/i386/18.08
      ref: 46794c577a0431196fd0ee29bfc4316713af5c267dfa3d64054cfffe7d9fdce7
  - bootstrap_build_arch == "aarch64":
      track: runtime/org.freedesktop.Sdk.PreBootstrap/aarch64/18.08
      ref: 68f05bde7a9d49a5d32c935b2830e4da96fdaf75d09bf04c870eaaf3b27e3cfb
  - bootstrap_build_arch == "arm":
      track: runtime/org.freedesktop.Sdk.PreBootstrap/arm/18.08
      ref: 01e711759ba27a6c282de03eb453e1230cbddbdcf24bc21798a38ce217d6bd8e

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
