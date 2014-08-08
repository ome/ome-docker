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

from sys import argv, exit
from os import environ
from glob import glob


prefix = environ.get("PREFIX", "omedocker")


def load_graph():
    graph = dict()
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
                        graph[source].append(target)
                    except KeyError:
                        graph[source] = [target]
    return graph


def print_dot(graph):
    print "digraph Dockerfiles {"
    for source, targets in graph.items():
        for target in targets:
            print '  "%s" -> "%s";' % (source, target)
    print "}"


def topo_sort(source):
    # See
    # http://blog.jupo.org/2012/04/06/topological-sorting-acyclic-directed-graphs/
    graph_unsorted = [(k, list(v)) for k, v in source.items()]

    from collections import defaultdict
    graph_unsorted = defaultdict(set)
    for old_source, targets in source.items():
        for target in targets:
            graph_unsorted[target].add(old_source)

    graph_sorted = []
    graph_unsorted = dict(graph_unsorted)

    while graph_unsorted:
        acyclic = False
        for node, edges in graph_unsorted.items():
            for edge in edges:
                if edge in graph_unsorted:
                    break
            else:
                acyclic = True
                del graph_unsorted[node]
                graph_sorted.append((node, edges))

        if not acyclic:
            raise RuntimeError("A cyclic dependency occurred")

    return graph_sorted


if __name__ == "__main__":
    g = load_graph()
    if len(argv) == 1:
        print_dot(g)
    elif len(argv) == 2 and argv[1] == "--order":
        for val, deps in topo_sort(g):
            if val.startswith(prefix):
                print val[len(prefix)+1:],
    else:
        print "Invalid arguments"
        exit(1)
