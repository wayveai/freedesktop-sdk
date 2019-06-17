kind: stack

(?):
- import_bootstrap:
    depends:
    - filename: bootstrap/import-bootstrap.bst
- not import_bootstrap:
    depends:
    - filename: bootstrap/bootstrap.bst
