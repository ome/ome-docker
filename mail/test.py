#!/usr/bin/env python

import sys
import smtplib

host = "localhost"
port = 2525
if len(sys.argv) >= 2:
    host = sys.argv[1]
if len(sys.argv) >= 3:
    port = int(sys.argv[2])

s = smtplib.SMTP(host, port)
s.sendmail("from@localhost", ["to@localhost"],
           "Subject: test\nfirstline")
