function nudp --wraps='sudo nmap -sU -T4 -v --min-rate 3000 -oN nmap/udp.nmap' --description 'alias nudp=sudo nmap -sU -T4 -v --min-rate 3000 -oN nmap/udp.nmap'
    echo "sudo nmap -sU -T4 -v --min-rate 3000 -oN nmap/udp.nmap $argv"
    sudo nmap -sU -T4 -v --min-rate 3000 -oN nmap/udp.nmap $argv
end
