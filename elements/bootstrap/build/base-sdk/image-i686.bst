kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: flathub:repo/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: files/keys/flathub.gpg
  track: runtime/org.freedesktop.BaseSdk/i386/1.6
  ref: 63f9537eea89448ec865f907a3ec89b261493b3d999121a81603c827b6219d20

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
