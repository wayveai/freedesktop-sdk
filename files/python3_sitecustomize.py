import sysconfig
import sys

fmt = "/app/{platlibdir}/python{py_version_short}/site-packages"
path = fmt.format(**sysconfig.get_config_vars())

for position, item in enumerate(sys.path):
    if item.startswith(sys.base_prefix) and item.endswith("site-packages"):
        break
else:
    position = -1

sys.path.insert(position, path)
