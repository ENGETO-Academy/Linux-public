#!/bin/bash

. data/tests/util.sh

test_su()
{
    if [[ $(stat -c "%A" /bin/su) =~ [^x]$ ]]; then
        return 0
    else
        return 1
    fi
}


RES=0
run test_su "check su is unavailable" || RES=1
exit $RES
