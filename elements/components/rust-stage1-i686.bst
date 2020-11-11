kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.43.1-i686-unknown-linux-gnu.tar.xz
  ref: 171dc7cba06b7204604cdf3fac7669299e14a3e2d6de5a30c4be028f815ad1df
