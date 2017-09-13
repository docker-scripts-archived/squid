cmd_create_help() {
    cat <<_EOF
    create
        Create the squid container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    cp $APP_DIR/squid.conf .
    mkdir -p cache logs/squid3
    unset NETWORK
    orig_cmd_create \
        --mount type=bind,src=$(pwd)/squid.conf,dst=/etc/squid3/squid.conf,readonly \
        --mount type=bind,src=$(pwd)/cache,dst=/var/spool/squid3 \
        --mount type=bind,src=$(pwd)/logs/squid3,dst=/var/log/squid3 \
        --network host
}
