import sys
import site
import os

site.USER_BASE = os.environ.get("PYTHONUSERBASE", "/var/data/python")
old_index = sys.path.index(site.USER_SITE)
sys.path.remove(site.USER_SITE)
site.USER_SITE = None

sys.path.insert(old_index, site.getusersitepackages())
