#!/usr/bin/env python3

import datetime
import sys

if __name__ == "__main__":
    version = sys.argv[1]
    year, month = map(int, ("20" + version).split("."))
    timestamp = datetime.date.today()
    year += 2 # Releases have two years expiry

    expired = False
    if timestamp.year > year:
        expired = True
    elif timestamp.year >= year and timestamp.month > month:
        expired = True
    if expired:
        print(
            f"org.freedesktop.Platform {version} is no longer receiving "
            "fixes and security updates. "
            "Please update to a supported runtime version."
        )
