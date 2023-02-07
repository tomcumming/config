#!/bin/bash

# This script allows copying over SSH with control codes

contents="$(</dev/stdin)"
encoded=`base64 <<< "$contents"`
echo -en "\x1b]52;c;$encoded\x07"
