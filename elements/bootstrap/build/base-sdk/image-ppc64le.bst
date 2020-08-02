kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: freedesktop-sdk:releases/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/freedesktop-sdk.gpg
  track: runtime/org.freedesktop.Sdk.PreBootstrap/ppc64le/19.08
  ref: a7f482f15b1cb6c91098762abd2c1b56d802ab2d3d1af5c1001f7b5c75af3e19

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
