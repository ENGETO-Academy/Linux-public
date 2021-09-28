#!/bin/bash

. data/tests/util.sh

test_user()
{
    if [[ $(getent passwd $name) ]]; then
        return 0
    else
        return 1
    fi
}


RES=0
for name in sidious han chewie lando; do
    run test_user "check user $name exists" || RES=1
done

exit $RES
