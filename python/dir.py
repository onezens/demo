#!/usr/bin/env python
# encoding: utf-8

"""
dir.py

Created by wz on 2017-08-17.
Copyright © 2017 onezen.cc. All rights reserved.

"""

import imp
import sys
import os
import string
import time

imp.reload(sys)


def runDir(dir):
	targetPaths = []
	#三个参数：1.父目录 2.所有文件夹名字（不含路径） 3.所有文件名字
	for parent,dirnames,filenames in os.walk(dir):
		st = os.stat(parent)
		ctime =  int(st.st_ctime)
		if (ctime > 1501502400) & (ctime < 1501588800):
			print ctime
			targetPaths.append(parent)
		else: 
			print '*'
	print targetPaths

def main():

	if len(sys.argv) == 1 :
		filePath = '/'
	else:
		filePath = sys.argv[1]

	# st = os.stat(filePath)
	# print time.ctime(st.st_ctime) # 1501502400  1501588800
	runDir(filePath)




if __name__ == '__main__':
	main()
