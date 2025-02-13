#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import binascii

OUTPUT_PATH = './SourceCode/'

# Return an ASCII hex dump
def dump(src, length=16):
    result = []
    digits = 2
    for i in range(0, len(src), length):
       s = src[i:i+length]
       hexa = ' '.join(["%02X" % (x) for x in s])
       text = ''.join([chr(x) if 0x20 <= x < 0x7F else '.'  for x in s])
       result.append("%04X   %-*s   %s" % (i, length*(digits + 1), hexa, text) )
    return '\n'.join(result)


def scanDir(directory):
	for file in os.listdir(directory):
		print (file)
		print ('=' * len(file))
		data = open(directory+file,'rb').read()
		if data[0:2] != b'SC':
			print('### WRONG HEADER')
			print(dump(data))
			continue
		of = open(OUTPUT_PATH+file,'w')
		offset = 6
		while offset < len(data):
			lineLen = data[offset]
			lineNo = data[offset+1] + (data[offset+2]<<8)
			offset += 3
			lineStr = ''
			while True:
				ch = data[offset]
				offset += 1
				if ch == 0x00:
					break
				if ch == 0x81:
					ch = ' '
				else:
					ch = chr(ch)
				lineStr += ch
			print('%06d %s' % (lineNo,lineStr))
			of.write('%06d %s\n' % (lineNo,lineStr))
		of.close()
		print ('#' * 80)

if not os.path.exists(OUTPUT_PATH):
    os.makedirs(OUTPUT_PATH)
		
scanDir('./Blue Max Source disk 1/-/')
scanDir('./Blue Max Source disk 2 fxed/-/')
