function tun0_ip
    ip -4 addr show tun0 2>/dev/null | awk '/inet /{print $2}' | cut -d/ -f1
end

