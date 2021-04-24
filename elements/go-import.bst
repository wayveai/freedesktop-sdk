kind: stack

(?):
- import_bootstrap:
    depends:
    - bootstrap-import.bst
    - bootstrap/import-go.bst
- not import_bootstrap:
    depends:
    - bootstrap-import.bst
    - bootstrap/go-static.bst
