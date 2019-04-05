import sys
import site
import os

site.USER_BASE = os.environ.get("PYTHONUSERBASE", "/var/data/python")
old_user_site = os.path.abspath(site.USER_SITE)
old_index = sys.path.index(old_user_site)
sys.path.remove(old_user_site)
site.USER_SITE = None

sys.path.insert(old_index, site.getusersitepackages())
