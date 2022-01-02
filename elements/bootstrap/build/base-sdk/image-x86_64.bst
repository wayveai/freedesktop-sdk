kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: flathub:repo/
  gpg-key: keys/flathub.gpg
  track: runtime/org.freedesktop.Sdk/x86_64/19.08
  ref: daab4c12f9ff6d0e659fa046acf86d5ac65a2f7cf58b78fce71793a1a398bb7e

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
