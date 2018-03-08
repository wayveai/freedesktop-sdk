kind: stack
description: holds Intel specific elements

(?):
- target_arch == "i586" or target_arch == "x86_64":
   depends:
     - filename: platform-vaapi-intel.bst
