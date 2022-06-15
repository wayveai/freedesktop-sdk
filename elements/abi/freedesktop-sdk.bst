kind: junction

config:
  options:
    bootstrap_build_arch: "%{sandbox_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: github:wayveai/freedesktop-sdk.git
  track: release/21.08-wayve
  ref: freedesktop-sdk-21.08.13-0-gbed44c99b26e1ae57cf9efcd3e87aa182392741f
