#!/bin/bash

. data/tests/util.sh

test_sith_rule()
{
    if [[ ! -e /var/tmp/sith_rule.txt ]]; then
        return 1
    else
        return 0
    fi
}


test_contents()
{
    rule="two@there@should@be@no@more@no@less"
    content=$(cat /var/tmp/sith_rule.txt 2>/dev/null| \
              tr "\n " "@" | tr -s "@" | \
              sed 's/@$//g')
    if (diff <(echo -e $rule) <(echo $content)) &>/dev/null; then
        return 0
    else
        return 1
    fi
}


RES=0
run test_sith_rule "check sith_rule.txt exists" || RES=1
run test_contents "check sith_rule.txt has the right content" || RES=1
exit $RES
