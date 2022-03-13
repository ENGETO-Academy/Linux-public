STRING=\
$'> There was a reported security breach on one of our systems.
> Our monitoring tools show high CPU load on the breached system. User Test
> contacted our support and reported that they can no longer log in to their
> account.
> We suspect that their user account was compromised and used for malicious
> activity on the system. We also think that the high CPU load is related to
> this attack. Your task is to analyze the high resource consumption and take
> necessary steps to prevent any further attacks originating from this account.
> Try to find the actual source of malicious behaviour on the system so that
> our security team can analyze it and estimate the damage and data losses.
>
> It\'s up to you, admin!\n'

clear

for (( c=0; c < ${#STRING}; c++ ))
do
    printf  "%c" "${STRING:$c:1}"
    sleep 0.06
done
sleep 4

clear
less ASSIGNMENT
