kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: flathub:repo/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: files/keys/flathub.gpg
  track: runtime/org.freedesktop.BaseSdk/x86_64/1.6
  ref: 7306169ea9c563f3ce75bb57be9e94b0acf1d742edacab0aa751cf6646a4b52e

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
