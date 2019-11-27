kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: freedesktop-sdk:releases/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/freedesktop-sdk.gpg
  track: runtime/org.freedesktop.Sdk.PreBootstrap/ppc64le/19.08
  ref: 1811edcd29a00e9b92a3f90974f9156ddbbfd50782480690b0f96b3e8cf7a1b0

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
