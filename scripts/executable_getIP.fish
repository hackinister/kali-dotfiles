#!/bin/fish
ip -4 -o a show tun0 | awk '{print $4}' | cut -d/ -f1
