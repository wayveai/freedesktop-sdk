kind: import
sources:
  - kind: local
    path: files/snap/vulkaninfo-wrapper

public:
  bst:
    split-rules:
      app:
      - /vulkaninfo-wrapper
