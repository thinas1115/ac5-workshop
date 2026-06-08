#!/usr/bin/env bash
set +e

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