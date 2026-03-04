function __pick_file
    fd --type f | fzf
end
abbr -a !f --position anywhere --function __pick_file

function __pick_vpn
    set -l file (command ls /home/kali/hackingVPNs | fzf)
    if test -n "$file"
        echo "sudo openvpn /home/kali/hackingVPNs/$file" 
    end
end
abbr -a hack --position command --function __pick_vpn

# Navigation mit cd 
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

# 
function __pick_dir
  fd --type d | fzf
end
abbr -a !d --position anywhere --function __pick_dir

# Datei auswählen, um sie mit chezmoi zu bearbeiten
function __pick_chezmoi_edit
  set -l file (chezmoi managed | fzf)
  if test -n "$file"
    echo "chezmoi edit ~/$file --apply"
  end
end
abbr -a cme --position command --function __pick_chezmoi_edit

#Verwaltet Dateien anzeigen und an chezmoi forget übergeben
function __pick_chezmoi_forget
  set -l file (chezmoi managed | fzf)
  if test -n "$file"
    echo "chezmoi forget ~/$file"
  end
end
abbr -a cmf --position command --function __pick_chezmoi_forget

# Kitty Terminal
abbr --add icat "kitten icat"
