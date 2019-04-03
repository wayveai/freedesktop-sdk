import site
import os

site.USER_BASE = os.environ.get("PYTHONUSERBASE", "/var/data/python")
