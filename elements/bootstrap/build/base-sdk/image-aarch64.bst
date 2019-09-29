kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: flathub:repo/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: files/keys/flathub.gpg
  track: runtime/org.freedesktop.BaseSdk/aarch64/1.6
  ref: e5285e2b6f3c67122109bebbd5e9fc21b251c3377830b1faa64c68ec5fe6dc2a

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
