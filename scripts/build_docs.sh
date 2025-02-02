#!/usr/bin/env bash

set -eux

if [ -d ../hammerspoon ]; then
    HAMMERSPOON_PATH="../hammerspoon"
elif [ -d ./hammerspoon ]; then
    HAMMERSPOON_PATH="./hammerspoon"
else
    echo "Unable to find Hammerspoon"
    exit 1
fi

mkdir -p .docs_tmp
python "${HAMMERSPOON_PATH}/scripts/docs/bin/build_docs.py" -e "${HAMMERSPOON_PATH}/scripts/docs/templates/" -o .docs_tmp -i "jsfr's Spoons" -u "https://github.com/jsfr/Spoons/blob/main/" -j -t -n Source/
cp "${HAMMERSPOON_PATH}/scripts/docs/templates/docs.css" .docs_tmp/html/
cp "${HAMMERSPOON_PATH}/scripts/docs/templates/jquery.js" .docs_tmp/html/
mv .docs_tmp/html/* docs/
mv .docs_tmp/docs{,_index}.json docs/
