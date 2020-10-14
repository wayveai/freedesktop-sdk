#!/usr/bin/python3
from socket import gethostbyname
import sys

host = sys.argv[1]

with open("/etc/hosts", "a") as file:
    print(gethostbyname(host) + " " + host, file=file)
