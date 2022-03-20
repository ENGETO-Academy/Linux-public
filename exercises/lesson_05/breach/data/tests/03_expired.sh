#!/bin/bash

. data/tests/util.sh

test_account_disabled()
{

    if [[ $(getent passwd test) ]]; then
        if [[ $(getent passwd test | cut -d : -f 7) =~ nologin ]] ||
           [[ x"$(getent shadow test | cut -d : -f 8)" == "x0" ]]; then
            return 0
        else
            return 1
        fi
    else
        return 1
    fi
}


RES=0
run test_account_disabled "check for account preventive measures" || RES=1
exit $RES
