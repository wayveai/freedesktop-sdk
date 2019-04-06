kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: flathub:repo/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/flathub.gpg
  (?):
  - bootstrap_build_arch == "x86_64":
      track: runtime/org.freedesktop.BaseSdk/x86_64/1.6
      ref: 7306169ea9c563f3ce75bb57be9e94b0acf1d742edacab0aa751cf6646a4b52e
  - bootstrap_build_arch == "i686":
      track: runtime/org.freedesktop.BaseSdk/i386/1.6
      ref: 63f9537eea89448ec865f907a3ec89b261493b3d999121a81603c827b6219d20
  - bootstrap_build_arch == "aarch64":
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
