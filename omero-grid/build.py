#!/usr/bin/env python
#
# Helper script for building omero-grid Dockerfiles
# Could use docker-py instead?

import argparse
import subprocess
import os
import re
import sys


parser = argparse.ArgumentParser(
    description='Build and tag omero-grid Docker images. '
    'The tag will be based on any non-default parameters passed.')
parser.add_argument('image', help='Folder containing Dockerfile')
parser.add_argument('--release', default='latest', help='Release or branch')
parser.add_argument('--ci', help='CI server address')
parser.add_argument('--omego', help='Additional omego arguments')
parser.add_argument(
    '--tag', help='The full name/tag for the image, overrides all other naming')


args = parser.parse_args()
cmdline = ['docker', 'build']

image = os.path.basename(args.image)

user = 'openmicroscopy'
if args.ci:
    cmdline.extend(['--build-arg', 'CI_SERVER=%s' % args.ci])
    user = re.match('(\w+://)?([^/]+)', args.ci, re.I).group(2)
    user = re.subn('[^\w]+', '-', user)[0]

if args.release:
    cmdline.extend(['--build-arg', 'OMERO_VERSION=%s' % args.release])

name = image
if args.omego:
    cmdline.extend(['--build-arg', 'OMEGO_ARGS=%s' % args.omego])
    name = 'X-%s' % image

if args.tag:
    tag = args.tag
else:
    tag = '%s/%s:%s' % (user, name, args.release)
tag = tag.lower()

cmdline.extend(['-t', tag])
cmdline.append(image)

print 'Running: %s' % ' '.join(cmdline)
rc = subprocess.call(cmdline)
if rc:
    sys.stderr.write('ERROR: Non-zero return code: %d: rc\n' % rc)
else:
    print 'Built: %s' % tag
sys.exit(rc)
