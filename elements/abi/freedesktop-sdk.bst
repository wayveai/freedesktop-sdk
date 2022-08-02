kind: junction

config:
  options:
    bootstrap_build_arch: "%{sandbox_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: github:wayveai/freedesktop-sdk.git
  track: release/21.08-wayve
  ref: freedesktop-sdk-21.08.13-wayve1-0-g6f246b5040ec5b011cdea0ab2c697302b3d4a31d
