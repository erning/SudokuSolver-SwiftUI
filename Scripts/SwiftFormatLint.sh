#!/bin/sh

# ${PROJECT_DIR}
DIR="$(cd "$(dirname "$0")/.."; pwd)"

if which swift-format >/dev/null; then
    swift-format lint \
        --configuration ${DIR}/swift-format.json \
        --ignore-unparsable-files \
        -r ${DIR}
    exit 0
else
    echo "warning: swift-format not installed"
fi
