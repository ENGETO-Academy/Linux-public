#!/bin/bash

. data/tests/util.sh

test_smugglers_sgid()
{
    if [[ $(stat -c "%A" /smugglers 2>/dev/null) =~ ^d[rwx]{5}s ]]; then
        return 0
    else
        return 1
    fi
}


test_job_exists()
{
    if [[ -e /smugglers/ledger/job.txt ]]; then
        return 0
    else
        return 1
    fi
}


test_job_backup()
{
    if [[ -e /home/han/job.txt ]]; then
        return 0
    else
        return 1
    fi
}


test_job_content()
{
    # We need to compare against Han's copy because Lando will modify the
    # original
    seconds="$(date -d '12/24/2020 18:18' +%s)"
    if ! [[ -e /home/han/job.txt ]]; then
        return 1
    fi

    if [[ -z $(diff <(echo -e $seconds) /home/han/job.txt) ]]; then
        return 0
    else
        return 1
    fi
}


RES=0
run test_smugglers_sgid "check smugglers is inherited in '/smugglers'" || RES=1
run test_job_exists "check job.txt exists in the smugglers' ledger" || RES=1
run test_job_backup "check han has backed up the job data" || RES=1
run test_job_content "check the timestamp of the smugglers' job" || RES=1
exit $RES
