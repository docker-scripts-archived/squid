cmd_start() {
    is_up && return
    docker start $CONTAINER
    _add_iptable_rules
}

cmd_stop() {
    is_up || return
    _clear_iptable_rules
    docker stop $CONTAINER 2>/dev/null
}

_add_iptable_rules() {
    _clear_iptable_rules

    iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to 3129 -w
    iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to 3129 -w
}

_clear_iptable_rules() {
    iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to 3129 -w 2>/dev/null
    iptables -t nat -D OUTPUT -p tcp --dport 80 -j REDIRECT --to 3129 -w 2>/dev/null
}
