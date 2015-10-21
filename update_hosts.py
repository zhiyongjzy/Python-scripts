#!/usr/bin/evn python2
# Get hosts for google
import urllib2
import re
url = 'http://www.360kb.com/kb/2_150.html'
response = urllib2.urlopen(url)
body = response.read()
tmp = body.split("#google hosts")[1]
tmp = tmp.replace("<br />", "")
print tmp
header = """# localhost name resolution is handled within DNS itself.
127.0.0.1       localhost
::1             localhost
# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters


"""
hosts = header + "\n#" + tmp

#fl = open(r'C:\WINDOWS\system32\drivers\etc\hosts', 'w')
fl = open(r'hosts', 'w')
fl.write(hosts)
fl.close()


