kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.47.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: b9e225458e84d4004654f10f99fc4924bf36d2e2ded4927227892479c08a5921
