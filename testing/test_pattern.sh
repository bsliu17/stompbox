#!/bin/bash

echo "Use: put the logstash filter in pattern.dat, and input data in input.dat"

rm output.dat
touch tmp output.dat
./handle_json.py 1
../bin/logstash -f pattern.dat  < tmp
./handle_json.py 2
cat output.dat
rm tmp
