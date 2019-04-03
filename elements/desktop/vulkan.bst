kind: stack

depends:
  - filename: desktop/vulkan-headers.bst
  # vulkan-validation-layer depends on vulkan icd loader  (runtime)
  - filename: desktop/vulkan-icd-loader.bst
  - filename: desktop/vulkan-validation-layers.bst
