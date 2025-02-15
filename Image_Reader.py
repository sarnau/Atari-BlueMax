#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import struct
import binascii
from PIL import Image, ImageDraw, ImageShow, ImageFont


PIXEL_SET = '█︎'
PIXEL_CLEAR = ' '

data = bytearray(0x0C00)+open('BlueMax.xex','rb').read()[6:]

class bcolors:
	BLACK = '\033[38;5;0m'
	WHITE = '\033[38;5;15m'
	RED = '\033[38;5;1m'
	CYAN = '\033[38;5;13m'
	PURPLE = '\033[38;5;5m'
	GREEN = '\033[38;5;2m'
	BLUE = '\033[38;5;4m'
	YELLOW = '\033[38;5;11m'

	ORANGE = '\033[38;5;220m'
	BROWN = '\033[38;5;88m'
	LIGHT_RED = '\033[38;5;9m'
	DARK_GREY = '\033[38;5;238m'
	GREY = '\033[38;5;244m'
	LIGHT_GREEN = '\033[38;5;10m'
	LIGHT_BLUE = '\033[38;5;12m'
	LIGHT_GREY = '\033[38;5;252m'
	
	DEFAULT = '\033[1;39m'

atari_colors = (
			bcolors.BLACK,
			bcolors.GREEN,
			bcolors.BLUE,
			bcolors.GREY,
			)


def drawImage(firstOffset=0x00,lastOffset=0x40,isColor=False,name=''):
	titel = '%s ($%04x-$%04x)' % (name,firstOffset,lastOffset)
	print(titel)
	print('=' * len(titel))
	if isColor:
		width = 8
		lineLen = 16
	else:
		width = 8
		lineLen = 8
	gap = 0
	chheight = 8
	for row in range(firstOffset,lastOffset):
		bstr = '{:08b}'.format(data[row])
		st = ''
		if isColor:
			for i in range(0,len(bstr),2):
				val = int(bstr[i:i+2],2)
				st += atari_colors[val]+PIXEL_SET*2
			st += bcolors.DEFAULT
		else:
			st = bstr.replace('1',PIXEL_SET*2).replace('0',PIXEL_CLEAR*2)
		print('%2d %s' % (row-firstOffset,st))
	print()

drawImage(0x52D7,0x52E7,False,"P0IMAGE")
drawImage(0x52E7,0x5303,False,"P1IMAGE")
#drawImage(0x5303,0x5308,False,"CARRT")
#drawImage(0x5308,0x530D,False,"CARLT")
#drawImage(0x530D,0x5312,False,"TYRRT")
#drawImage(0x5312,0x5317,False,"TYRLT")
#drawImage(0x5317,0x531D,False,"TRRT")
#drawImage(0x531D,0x5323,False,"TYRTRR")
#drawImage(0x5323,0x5329,False,"TRLT")
#drawImage(0x5329,0x532F,False,"TYRTRL")
drawImage(0x532F,0x5339,False,"SHDW")
drawImage(0x5339,0x5343,False,"PLANE1")
drawImage(0x5343,0x534B,False,"PROPIM")
drawImage(0x538E,0x539B,False,"XPL1IM")
#drawImage(0x53C7,0x53D3,False,"SHPIM")
#drawImage(0x53D3,0x53DF,False,"SHPIM1")
drawImage(0x5421,0x542B,False,"FTR")
drawImage(0x542B,0x5436,False,"FTL")
#drawImage(0x5436,0x543F,False,"GNST")
drawImage(0x543F,0x5449,False,"XCRIM")
drawImage(0x5449,0x5456,False,"XSHPIM")
drawImage(0x5498,0x54A5,False,"AAH")
drawImage(0x54A5,0x54B2,False,"AAI")
drawImage(0x54F2,0x5504,False,"XCPTLIM")
