has() {
  state="$(scripts/config -s "${1}")"
  case "${state}" in
    undef|n)
      return 1
    ;;
    y|m)
      return 0
    ;;
    *)
      echo "Wrong status for ${1}: ${state}" 1>&2
      exit 1
    ;;
  esac
}
remove() {
  scripts/config -d "${1}"
}
module() {
  has "${1}" || scripts/config -m "${1}"
}
enable() {
  scripts/config -e "${1}"
}
value() {
  scripts/config --set-str "${1}" "${2}"
}
