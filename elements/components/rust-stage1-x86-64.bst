kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.47.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 123f8840258d5f9c858f957aa3930d045c6bdf80074d081c1ab4ef0c1d6e1c73
