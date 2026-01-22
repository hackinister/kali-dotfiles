#!/bin/fish
set ip_addr (ip -4 -o a show tun0 2>/dev/null | awk '{print $4}' | cut -d/ -f1)

if test -n "$ip_addr"
	echo " $ip_addr"
	set -Ux LIP "$ip_addr"
else
	echo "   "
end

