kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: freedesktop-sdk:releases/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/freedesktop-sdk.gpg
  track: runtime/org.freedesktop.Sdk.PreBootstrap/x86_64/19.08
  ref: 8a3c70f3b2a46ff448534cf901cd09e18c8e22e99895252d9c7ed5c7271881c5

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
