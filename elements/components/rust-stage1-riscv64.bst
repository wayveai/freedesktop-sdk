kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.57.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 9f2ed94ab94c3418f13ba895625d32ab36cf3779de90e9b7592bcca00b6b6e4a
