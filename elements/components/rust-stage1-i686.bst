kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.54.0-i686-unknown-linux-gnu.tar.xz
  ref: 9c3baf8ec849978b0206262fc402ac9d24fdb2a8ae7b5d785b09022dbdbc20e8
