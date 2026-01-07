function nmap_ports --description "Extrahiert offene Ports aus NMAP-Scan"
    # Überprüfe ob ein Argument übergeben wurde
    if test (count $argv) -eq 0
        echo "Verwendung: nmap_ports <nmap-scan-datei>"
        echo "Beispiel: nmap_ports scan.nmap"
        return 1
    end

    set scan_file $argv[1]

    # Überprüfe ob die Datei existiert
    if not test -f $scan_file
        echo "Fehler: Datei '$scan_file' nicht gefunden"
        return 1
    end

    # Extrahiere offene Ports und formatiere sie
    set ports (rg "^[0-9]+/tcp.*open" $scan_file | awk '{print $1}' | cut -d'/' -f1 | string join ", ")

    # Gib die Ports aus
    if test -n "$ports"
        echo $ports
    else
        echo "Keine offenen Ports gefunden"
    end
end
