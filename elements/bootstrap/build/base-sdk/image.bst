kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: https://sdk.gnome.org/repo/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/gnome-sdk.gpg
  (?):
  - bootstrap_build_arch == "x86_64":
      track: runtime/org.freedesktop.BaseSdk/x86_64/1.6
      ref: cd99f96a45ff60feca0afbb64dfee6de51bd26a11d6cf2d861fecd1a7691080a
  - bootstrap_build_arch == "i686":
      track: runtime/org.freedesktop.BaseSdk/i386/1.6
      ref: 024f351c3a426841059bc22c4d523ed49e90a24f0b0d39d85f653a10f77aaa5f
  - bootstrap_build_arch == "aarch64":
      track: runtime/org.freedesktop.BaseSdk/aarch64/1.6
      ref: 3333fee02b034e5cd1884ab55433c6b236a4d8648303a7d87be57de510a8f76a

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
