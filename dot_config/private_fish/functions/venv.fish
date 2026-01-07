function venv
    # Überprüfe ob ein Name übergeben wurde, sonst nutze "venv" als Standard
    set -l venv_name venv
    if test (count $argv) -gt 0
        set venv_name $argv[1]
    end

    # Erstelle die virtuelle Umgebung
    if python3 -m venv $venv_name
        echo "✓ Virtuelle Umgebung '$venv_name' erstellt"
        
        # Aktiviere die Umgebung automatisch
        source $venv_name/bin/activate.fish
        echo "✓ Umgebung aktiviert"
    else
        echo "✗ Fehler beim Erstellen der virtuellen Umgebung"
        return 1
    end
end
