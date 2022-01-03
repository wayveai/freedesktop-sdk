kind: junction

config:
  options:
    bootstrap_build_arch: "%{sandbox_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  # When creating release, release branch must be tracked to get a ref
