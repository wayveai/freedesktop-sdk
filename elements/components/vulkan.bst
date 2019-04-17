kind: stack

depends:
  - filename: components/vulkan-headers.bst
  # vulkan-validation-layer depends on vulkan icd loader  (runtime)
  - filename: components/vulkan-icd-loader.bst
  - filename: components/vulkan-validation-layers.bst
