function cmap --wraps='chezmoi apply' --description 'alias cmap=chezmoi apply'
    chezmoi -v apply $argv
end
