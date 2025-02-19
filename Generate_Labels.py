#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Generate a BlueMax.labels file for Retro Debugger

import re

setname_pattern = r'set_name\W*\((.+),\W*"(.+)"(, .+)?\)'
set_cmt = r'set_cmt\W*\((.+),\W*"(.+)"(,\W*.+)?\)'

labels = {}
def add_info(addr,name,comment):
	global labels
	if addr not in labels:
		labels[addr] = {}
	if name:
		labels[addr]['Name'] = name
	if comment:
		labels[addr]['Comment'] = comment

for line in open('BlueMax.idc','rb').readlines():
	line = line.decode('utf-8').strip()
	if line.startswith('set_name'):
		for found in re.findall(setname_pattern, line):
			if found[1].startswith('.'): # ignore all local labels
				continue
			add_info(int(found[0],16), found[1], None)
	if line.startswith('set_cmt'):
		for found in re.findall(set_cmt, line):
			add_info(int(found[0],16), None, found[1])


if len(labels)==0:
	sys.exit(0)


fo = open('BlueMax.labels','w')
fo.write("""{
  Version: "1"
  Segments: [
    {
      Name: Default
      CodeLabels: [
""")
for addr in sorted(labels):
	if 'Name' not in labels[addr]:
		continue
	fo.write("        {\n")
	fo.write("          Address: 0x%04x\n" % addr)
	name = labels[addr]['Name'].replace('.','_').strip()
	fo.write("          Name: %s\n" % name)
	if 'Comment' in labels[addr]:
		cmt = labels[addr]['Comment']
		fo.write("          Comment: %s\n" % cmt)
	fo.write("        },\n")
fo.write("""      ]
    }
  ]
}""")
fo.close()
