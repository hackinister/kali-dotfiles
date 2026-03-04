function ntcp --wraps='sudo nmap -sVC -p- --min-rate 3000 --reason -v -oN nmap/tcp.nmap' --description 'Führt einen nmap Scan durch und setzt eine globale Variable für die Target IP'
    set -l ip_addr $argv[1]

    set -l prefix "RH"
    
    if test -z "$ip_addr"
        echo "Fehler: Bitte gib eine IP-Adresse an."
        echo "Nutzung: ntcp <IP-ADRESSE>"
        return 1
    end

    set -l existing_vars (set -n | string match -r "^$prefix\d+\$")

    set -l next_num 1

    if test -n "$existing_vars"
        set -l max_num (string replace "$prefix" "" $existing_vars | sort -n | tail -1)
        set next_num (math $max_num +1)
    end

    set -l suggestion "$prefix$next_num"

    read -P "Wie soll die Variable heißen: " -c "$suggestion" var_name
    
    if test -z "$var_name"
        echo "Kein Name angegeben. Nutze Vorschlag: $suggestion"
        set var_name $suggestion
    end


    set -Ux $var_name $ip_addr

    echo "Variable \$$var_name wurde auf $ip_addr gesetzt."
    echo "------------------------------------------------"

    echo "Starte Scan auf Ziel: $ip_addr ..."

    echo "sudo nmap -sVC -p- -Pn --min-rate 3000 --reason -v -oN nmap/tcp.nmap"
    sudo nmap -sVC -p- -Pn --min-rate 3000 --reason -v -oN nmap/tcp.nmap $argv
end
