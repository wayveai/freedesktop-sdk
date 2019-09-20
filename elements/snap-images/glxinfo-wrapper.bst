kind: import
sources:
  - kind: local
    path: files/snap/glxinfo-wrapper

public:
  bst:
    split-rules:
      app:
      - /glxinfo-wrapper
