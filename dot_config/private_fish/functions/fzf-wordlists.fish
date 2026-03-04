function fzf-wordlists --wraps='find -t f . /usr/share/seclists | fzf' --description 'alias fzf-wordlists=find -t f . /usr/share/seclists | fzf'
    find -e txt -t f . /usr/share/seclists /usr/share/wordlists /usr/share/dirbuster /usr/share/wfuzz | fzf $argv
end
