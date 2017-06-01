from __future__ import print_function
import os
import lxml.html
import ftplib
from urllib2 import urlopen

glcf = 'http://glcfapp.glcf.umd.edu:8080/esdi/ftp?id='


def dlfile(url):
  # Open the url
  f = urlopen(url)
print("downloading " + url)
# Open our local file for writing
dom = lxml.html.fromstring(f.read())
ftp = ftplib.FTP('ftp.glcf.umd.edu')
ftp.login()
fpath = dom.xpath('//a/@href')[0]
ftp.cwd('/'.join(fpath.split('/')[3:]))
d = ftp.nlst()
for link in d:
  with open(link, "wb") as f:
  ftp.retrbinary('RETR %s' % link, f.write)
print('Downloaded ' + link)


def iterdl(ids, savepath):
  os.chdir(savepath)
# Iterate over image ranges
for i in ids:
  #os.mkdir(i)
  #os.chdir(os.path.join(savepath, i))
  url = glcf + i
dlfile(url)

ids = ["285915","285950","285951","285952","285953","285954","285955",
       "285956","285957","285958","285994","285995","285996","285997",
       "285998","285999","286000","286001","286002","286003","286004",
       "286046","286047","286048","286049","286050","286051","286052",
       "286053","286054","286097","286098","286099","286100","286101",
       "286102","286103","286149"]
iterdl(ids, r"C:\Users\Jamie\Documents\mad_treecov")
