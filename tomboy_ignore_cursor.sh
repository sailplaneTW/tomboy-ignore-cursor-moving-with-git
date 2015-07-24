#!/usr/bin/env bash

ORI_DIR=`pwd`
TOMBOY_DIR=${1}

# ---------------------------------------------------- #
cd ${TOMBOY_DIR}

for f in *.note
do
    rm /tmp/tomboy.diff >& /dev/null
    git diff ${f} > /tmp/tomboy.diff

    ignorelines=`cat /tmp/tomboy.diff | grep -e '^+ ' -e '^- ' | grep -v '<cursor-position>' | grep -v '<selection-bound-position>' | grep -v '<x>' | grep -v '<y>' | wc -l`

    if [[ ${ignorelines} -eq 0 ]]; then
        git checkout ${f}
    else
        # TODO commit
    fi
done

rm -f /tmp/tomboy.diff /tmp/gitdiff.txt
cd ${ORI_DIR}
