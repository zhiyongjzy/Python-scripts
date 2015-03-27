#!/usr/bin/evn python2
import urllib2
import re
url = 'http://www.360kb.com/kb/2_122.html'
response = urllib2.urlopen(url)
body = response.read()
list = body.split("=====")
tmp = list[1]
tmp = tmp.split("#google hosts")[0]
origin = """# localhost name resolution is handled within DNS itself.
#	127.0.0.1       localhost
#	::1             localhost
"""

#fl = open(r'C:\WINDOWS\system32\drivers\etc\hosts', 'w')
fl = open(r'.\hosts', 'w')
fl.write(origin)
#print tmp
fl.write(tmp)
fl.close()


