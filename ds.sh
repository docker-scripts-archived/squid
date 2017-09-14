cmd_start() {
    is_up && return
    docker start $CONTAINER

    iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to 3129 -w 2>/dev/null
    iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to 3129 -w
}

cmd_stop() {
    iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to 3129 -w 2>/dev/null

    is_up || return
    docker stop $CONTAINER 2>/dev/null
}
