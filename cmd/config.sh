cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    ds inject ubuntu-fixes.sh
    ds inject set_prompt.sh
    ds inject ssmtp.sh
    ds inject squid.sh
}
