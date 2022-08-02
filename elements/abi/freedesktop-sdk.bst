kind: junction

config:
  options:
    bootstrap_build_arch: "%{sandbox_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/21.08
  ref: freedesktop-sdk-21.08.14-89-g8403ab4daa51def8e951dc1ecf46cdea03ac12f9
