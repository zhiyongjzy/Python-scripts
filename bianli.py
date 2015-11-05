#!/usr/bin/python

import os
import shutil
rootdir= './a'
filepath = '/tmp/Makefile'
dirs = ''
files = ''
for parent,dirnames,filenames in os.walk(rootdir):
	dirs = ''
	files = ''
	shutil.copyfile(filepath, parent + '/Makefile');		
	f=open(parent+'/Makefile', 'a');
	for dirname in dirnames:
		dirs = dirs + ' ' + dirname		
	for filename in filenames:
		#print filename[-2:]
		if filename[-2:] == ".c":
			files = files + ' ' + filename
	f.write("SRCS = " + files)
	f.write("\nSUB_DIRS = " + dirs)
	f.close()

