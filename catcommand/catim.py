#!/usr/bin/env python

import sys, os

if len(sys.argv) < 2:
    print "Error: Expected arguments."
else:
    fileContents = ""
    for i in range(1, len(sys.argv)):
        if os.path.exists(sys.argv[i]):
            currFile = open(sys.argv[i], "r")
            fileContents += currFile.read()
            
            currFile.close();
        else:
            print ("Error: File '" + sys.argv[i] + "' does not exist.")
      
    print fileContents
