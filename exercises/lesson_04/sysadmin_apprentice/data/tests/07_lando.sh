#!/bin/bash

. data/tests/util.sh

lando_in_smugglers()
{
    if (groups lando | grep smugglers) &>/dev/null; then
        return 0
    else
        return 1
    fi
}


test_job_content()
{
    # fail immediately if Lando is in the smugglers group
    lando_in_smugglers && return 1

    seconds="$(( $(date -d '12/24/2020 18:18' +%s) + 3600 ))"
    if ! [[ -e /smugglers/ledger/job.txt ]]; then
        return 1
    fi

    if [[ -z $(diff <(echo -e $seconds) /smugglers/ledger/job.txt) ]]; then
        return 0
    else
        return 1
    fi
}


test_lando_acl()
{
    # fail immediately if Lando is in the smugglers group
    lando_in_smugglers && return 1

    if (getfacl -p /smugglers | grep "^user:lando:---") &>/dev/null; then
        return 0
    else
        return 1
    fi
}


RES=0
run test_job_content "check lando changed the timestamp in job.txt" || RES=1
run test_lando_acl "check lando cannot access smugglers with password" || RES=1
exit $RES
