#!/usr/bin/env bash
set +e

if [ -z "${CODE_SERVER_BIND_ADDR}" ]; then
    CODE_SERVER_BIND_ADDR="0.0.0.0:5000"
fi

CONTAINERWSF="${CONTAINERWSF:-/lab}"

code-server \
    --bind-addr "${CODE_SERVER_BIND_ADDR}" \
    --auth password \
    --disable-telemetry \
    --disable-update-check \
    --disable-workspace-trust \
    "${CONTAINERWSF}" &

if ! ${CODESPACES:-false}; then
    if [ ${@+True} ]; then
        exec "$@"
    else
        if [ -f "/bin/zsh" ]; then
            exec zsh
        else
            exec sh
        fi
    fi
fi