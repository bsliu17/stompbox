#!/usr/bin/python

import json
import sys

def clean_json():
    print "Formatting crappy input..."
    src = open("input.dat", "r")
    dst = open("tmp", "w")
    data = json.dumps(json.loads(src.read()))
    dst.write(data)
    dst.close()
    return

def nice_display():
    print "Displaying result: "
    all_json = ""
    fp = open("tmp", "r")
    data = fp.read()
    for line in data:
        # ignore warnings from logstash
        if line[-6:] != "warn}\n":
            all_json += line
    nice = json.dumps(json.loads(all_json), sort_keys=True, indent=4, separators=(',',': '))
    fp = open("output.dat", "w")
    fp.write(nice)
    fp.close()
    return

if __name__ == "__main__":
    if sys.argv[1] == "1":
        clean_json()
    elif sys.argv[1] == "2":
        nice_display()
