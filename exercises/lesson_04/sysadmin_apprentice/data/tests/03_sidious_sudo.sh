#!/bin/bash

. data/tests/util.sh

test_sidious()
{
    if (sudo -U sidious -l | grep -E "NOPASSWD:[[:space:]]*ALL") &>/dev/null; then
        return 0
    else
        return 1
    fi
}


RES=0
run test_sidious "check sidious has passwordless sudo" || RES=1
exit $RES
