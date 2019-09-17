kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: freedesktop-sdk:releases/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/freedesktop-sdk.gpg
  track: runtime/org.freedesktop.Sdk.PreBootstrap/x86_64/18.08
  ref: d4aa8805ee9d8d00c0c419f262178f92e7e7d52370a61d32a6a2770c2958e9a1

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
