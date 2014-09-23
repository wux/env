# touch
touch __babysitter_lock.50001

# ssh
timeout 12 ssh -T -2 -x -q -oCompression=no -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -oPubkeyAuthentication=yes -oPasswordAuthentication=no upadmin@10.1.2.6 

# check/clear lock
'[[ ! -f /tmp/__babysitter_lock.50001 ]] || ([ $(stat -c "%Z" /tmp/__babysitter_lock.5001) -lt $[$(date +%s) - 1] ] && { rm -f /tmp/__babysitter_lock.50001; } ) 2>/dev/null || exit 121'

# acquire lock
touch /tmp/__babysitter_lock.50001 2>/dev/null || exit 122;

# kill -15
pids=($(ps --no-headers -o pgid $(pgrep -u upprod1 -f "/upthere/bin/loop\.sh .*echo_server.py.*-port[ |=]50001"))); [[ ${#pids[*]} -eq 0 ]] || { list=$(printf " -%s" "${pids[@]}"); echo "sudo -u upprod1 kill -15 ${list}"; }

# sleep
sleep 10

# kill -9
[[ ${#pids[*]} -eq 0 ]] || { echo "sudo -u upprod1 kill -9 ${list}"; }

# start job
sudo --non-interactive --background  -u upprod1 /upthere/bin/loop.sh /upthere/bin/echo_server.py --port 50001 2>&1 >> /disk/a/logs/loop.10.1.2.6.50001.upprod1.echo_server.py.$$ > /dev/null 2>&1; [[ $? == 0 ]] || exit 123;

# unlock
rm -f /tmp/__babysitter_lock.50001 2> /dev/null || exit 124;
