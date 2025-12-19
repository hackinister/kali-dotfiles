function fish_right_prompt
    set -l tun0_addr (tun0_ip)
    set -l utc_time (date -u +"%H:%M UTC")

    string join '' -- "[" (set_color -o yellow) $utc_time (set_color normal) "● " (set_color -o magenta) \($tun0_addr\) (set_color normal) "]"
end
