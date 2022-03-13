#!/bin/bash

. data/tests/util.sh

test_crontab()
{
    if ! (crontab -l -u test &>/dev/null); then
        return 0
    else
        return 1
    fi
}


RES=0
run test_crontab "check that the malicious code cannot be scheduled" || RES=1
exit $RES
