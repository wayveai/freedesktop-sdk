kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: flathub:repo/
  gpg-key: keys/flathub.gpg
  track: runtime/org.freedesktop.Sdk/aarch64/19.08
  ref: 8ff76d7217ef985a89661b3ee40025c854c91c971e6456b88201d6cbd85cd52a

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
