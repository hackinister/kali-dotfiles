#!/bin/fish
set ip (ip -4 -o a show tun0 2>/dev/null | awk '{print $4}' | cut -d/ -f1)

if ip -n "$ip"
	echo " $ip"
	set -Ux LIP "$ip"
else
	echo "   "
end

