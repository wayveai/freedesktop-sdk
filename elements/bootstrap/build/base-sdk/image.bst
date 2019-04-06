kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: freedesktop-sdk:releases/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/freedesktop-sdk.gpg
  (?):
  - bootstrap_build_arch == "x86_64":
      track: runtime/org.freedesktop.Sdk.Minimal/x86_64/18.08
      ref: f93e26d861f241f0fa910d2793a147e0eed08c69f8caf1bb5eb59615b4c3bfc7
  - bootstrap_build_arch == "i686":
      track: runtime/org.freedesktop.Sdk.Minimal/i386/18.08
      ref: 54bbf7d46357ae61e86454b61a0b0d07be6849440f089c1d69011cc62d1666e5
  - bootstrap_build_arch == "aarch64":
      track: runtime/org.freedesktop.Sdk.Minimal/aarch64/18.08
      ref: 17ce7e3c4b9c4598a637c9682b34be1676375245c04ee6e3bf7e9031777ef2f8
  - bootstrap_build_arch == "arm":
      track: runtime/org.freedesktop.Sdk.Minimal/arm/18.08
      ref: c802b6bd8765f2b0798f986ddccb6f45ba468f0f7f521ded5effa7d3fb429c3b

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
