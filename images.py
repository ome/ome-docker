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
Inspects the images in the local docker
"""

import re
import docker

from collections import namedtuple
from collections import defaultdict

Pattern = re.compile("^((.*)/)?(.*?)(:(.*?))?$")

Fields = ["Id", "RepoTags", "Size", "VirtualSize",
          "Created", "ParentId"]
DockerImage = namedtuple("DockerImage", Fields)


def sizeof(num):
    for x in ['bytes', 'KB', 'MB', 'GB', 'TB']:
        if num < 1024.0:
            return "%3.1f %-5s" % (num, x)
        num /= 1024.0

c = docker.Client(base_url='unix:///var/run/docker.sock',
                  version='1.9',
                  timeout=10)


def split_tag(tag):
    m = Pattern.match(tag)
    if m is None:
        return ("", tag, "")
    else:
        rv = [m.group(2), m.group(3), m.group(5)]
        for idx, val in enumerate(rv):
            if val is None:
                rv[idx] = ""
        return tuple(rv)


categories = defaultdict(
    lambda: defaultdict(
        lambda: defaultdict(list)))

images = c.images()
for image in images:
    image = DockerImage(**image)
    for tag in image.RepoTags:
        cat, name, tag = split_tag(tag)
        categories[cat][name][tag].append(image)


def echo(cat, name, tag, image, count):
    print "%-16s /  %-24s : %-10s\t%16s\t%s" % (
        cat, name, tag, sizeof(image.Size),
        (cnt > 1 and ("%s more" % cnt) or "")
    )


for cat, names in sorted(categories.items()):
    for name, tags in sorted(names.items()):
        for tag, images in sorted(tags.items()):

                bydate = lambda a, b: cmp(a.Created, b.Created)
                images.sort(bydate)
                cnt = len(images)

                if cnt == 0:
                    continue

                echo(cat, name, tag, images[0], cnt)
