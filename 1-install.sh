#!/bin/bash

curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip2.py
# add 'deb http://archive.debian.org/debian/ stretch contrib main non-free' to install in debian
# https://www.reddit.com/r/linuxquestions/comments/1aejta0/is_there_any_way_to_get_python_2_on_debian_12/
python2.7 get-pip2.py

