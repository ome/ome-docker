#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# Copyright (C) 2014 Glencoe Software, Inc. All Rights Reserved.
# Use is subject to license terms supplied in LICENSE.txt
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

"""
Generates a dot representation of the relationships
between the Dockerfiles (and their dependencies) in
this repository.
"""

from os import environ
from glob import glob

from subprocess import PIPE
from subprocess import Popen


prefix = environ.get("PREFIX", "joshmoore")

links = dict()
dfiles = glob("*/Dockerfile")
for dfile in dfiles:
    with open(dfile, "r") as f:
        txt = f.read()
        for line in txt.split("\n"):
            if line.startswith("FROM "):
                source = line[5:]
                target = dfile.split("/")[0]
                target = "%s/%s" % (prefix, target)
                try:
                    links[source].append(target)
                except KeyError:
                    links[source] = [target]

print "digraph Dockerfiles {"
for source, targets in links.items():
    for target in targets:
        print '  "%s" -> "%s";' % (source, target)
print "}"
