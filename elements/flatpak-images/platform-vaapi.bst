kind: stack
description: holds Intel specific elements

(?):
- target_arch == "i686" or target_arch == "x86_64":
   depends:
     - filename: flatpak-images/platform-vaapi-intel.bst
