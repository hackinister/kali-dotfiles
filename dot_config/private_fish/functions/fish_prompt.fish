function fish_prompt
    set -l last_status $status
    set -l stat

    

    if test $last_status -ne 0
        set stat (set_color -o red)"[$last_status]"(set_color normal)
    end
    
    if functions -q fish_is_root_user; and fish_is_root_user
        set_color -o red
    else
        set_color -o yellow
    end

    echo -n $USER
    set_color -o white
    echo -n ㉿

    if test -z "$SSH_CLIENT"
        set_color -o blue
    else
        set_color -o cyan
    end

    echo -n (prompt_hostname)
    set_color blue
    echo -n ":"
    set_color green
    echo -n (prompt_pwd --full-length-dirs 2)
    set_color -o yellow
    echo -n $stat
    echo 
    echo -n "╰─>"

end
