#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import struct
import binascii
from PIL import Image, ImageDraw, ImageShow, ImageFont


PIXEL_SET = '█︎'
PIXEL_CLEAR = ' '

data = bytearray(0x0C00)+open('./Original Game/Tape Version/BlueMax.xex','rb').read()[6:]

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


def drawImage(firstOffset,lastOffset,name):
	titel = '%s ($%04x-$%04x)' % (name,firstOffset,lastOffset)
	print(titel)
	print('=' * len(titel))
	for row in range(firstOffset,lastOffset):
		bstr = '{:08b}'.format(data[row])
		st = bstr.replace('1',PIXEL_SET*2*2).replace('0',PIXEL_CLEAR*2*2)
		print('%2d %s' % (row-firstOffset,st))
	print()

drawImage(0x52D7,0x52E7,"P0IMAGE") # regular plane (0-9), contrast color (10-12), contrast color (13-15)
drawImage(0x52E7,0x5303,"P1IMAGE") # plane shadow (0-7), plane turning left (8-17), plane turning right (18-27)
drawImage(0x5303,0x5308,"CARRT")   # car driving right
drawImage(0x5308,0x530D,"CARLT")   # car driving left
drawImage(0x530D,0x5312,"TYRRT")   # car tyres driving right
drawImage(0x5312,0x5317,"TYRLT")   # car tyres driving left
drawImage(0x5317,0x531D,"TRRT")    # truck driving right
drawImage(0x531D,0x5323,"TYRTRR")  # truck tyres driving right
drawImage(0x5323,0x5329,"TRLT")    # truck driving left
drawImage(0x5329,0x532F,"TYRTRL")  # truck tyres driving left
drawImage(0x532F,0x5339,"SHDW")    # enemy plane shadow flying towards player
drawImage(0x5339,0x5343,"PLANE1")  # enemy plane flying towards player
drawImage(0x5343,0x534B,"PROPIM")  # enemy plane propeller animations (0-3 and 4-7)
drawImage(0x538E,0x539B,"XPL1IM")  # plane explosion
drawImage(0x53C7,0x53D3,"SHPIM")   # moving ship
drawImage(0x53D3,0x53DF,"SHPIM1")  # moving ship black highlight color
drawImage(0x5421,0x542B,"FTR")     # enemy plane turning right
drawImage(0x542B,0x5436,"FTL")     # enemy plane turning left
drawImage(0x5436,0x543F,"GNST")    # red-white flashing bullseye target
drawImage(0x543F,0x5449,"XCRIM")   # 
drawImage(0x5449,0x5456,"XSHPIM")  # moving ship explosion
drawImage(0x5498,0x54A5,"AAH")     # final targets (main color)
drawImage(0x54A5,0x54B2,"AAI")     # final targets (black color)
drawImage(0x54F2,0x5504,"XCPTLIM") # explosion off the final targets
