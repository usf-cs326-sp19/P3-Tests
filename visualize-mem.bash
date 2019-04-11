#!/usr/bin/env bash

if [[ "${#}" -ne 2 ]]; then
    echo "Usage: $(basename ${0}) mem-trace.mem output-file.pdf"
    exit 1
fi

./mem2dot.bash "${1}" | dot -Tpng > "${2}"

