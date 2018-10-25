kind: stack
depends:
- filename: bootstrap-dev-extract.bst
- filename: bootstrap-platform-extract.bst

public:
  bst:
    integration-commands:
    - |
      ldconfig
