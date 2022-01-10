kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/20.08
  ref: freedesktop-sdk-20.08.17-0-g18906b5db4240c51a54e74ebab946e979ea0e357
