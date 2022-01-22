# This element is just for optimization in CI. Pulling this from artifact
# cache server does not require pulling all dependencies.
kind: script

build-depends:
- components.bst

config:
  # In order to not stage components that might
  # have conflicts, we use a layout to only stage
  # some symbolic components.
  layout:
  - element: bootstrap-import.bst
    destination: /
