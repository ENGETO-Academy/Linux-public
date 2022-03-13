#!/bin/bash

G1="\e[1;32m"
G2="\e[0m"
R1="\e[1;91m"
R2="\e[0m"

ok()
{
    echo -e "[${G1}PASS${G2}] $1"
}

fail()
{
    echo -e "[${R1}FAIL${R2}] $1"
}

run()
{
    FUNC="$1"
    NAME="$2"

    $FUNC
    RES=$?

    if [ $RES -eq 0 ]; then
        ok "$NAME"
    else
        fail "$NAME"
    fi

    return $RES
}
