kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: flathub:repo/
  gpg-key: keys/flathub.gpg
  (?):
  - build_arch == "x86_64":
      track: runtime/org.freedesktop.BaseSdk/x86_64/1.6
      ref: cd99f96a45ff60feca0afbb64dfee6de51bd26a11d6cf2d861fecd1a7691080a
  - build_arch == "i386":
      track: runtime/org.freedesktop.BaseSdk/i386/1.6
      ref: 024f351c3a426841059bc22c4d523ed49e90a24f0b0d39d85f653a10f77aaa5f
config:
  source: files
  target: usr
