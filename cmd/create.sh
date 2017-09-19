cmd_create_help() {
    cat <<_EOF
    create
        Create the squid container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    [[ -f squid.conf ]] || cp $APP_DIR/squid.conf .
    ln -sf $APP_DIR/squid.conf.dist
    ln -sf $APP_DIR/squid.conf.cache-everything
    mkdir -p cache logs/squid

    unset NETWORK
    orig_cmd_create \
        --mount type=bind,src=$(pwd)/squid.conf,dst=/etc/squid/squid.conf,readonly \
        --mount type=bind,src=$(pwd)/cache,dst=/var/spool/squid \
        --mount type=bind,src=$(pwd)/logs/squid,dst=/var/log/squid \
        --network host
}
