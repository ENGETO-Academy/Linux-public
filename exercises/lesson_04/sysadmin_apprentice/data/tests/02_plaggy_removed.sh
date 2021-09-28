#!/bin/bash

. data/tests/util.sh

test_plaggy()
{
    if [[ ! $(getent passwd plaggy) ]] && [[ ! -d /home/plaggy ]]; then
        return 0
    else
        return 1
    fi
}


RES=0
run test_plaggy "check user plaggy was removed" || RES=1
exit $RES
