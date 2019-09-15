kind: import

config:
  target: "%{bindir}"

public:
  bst:
    integration-commands:
    - chmod u+x %{bindir}/apply_extra

sources:
- kind: local
  path: files/openh264/apply_extra
