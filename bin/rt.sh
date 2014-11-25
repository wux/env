timeout 2 ssh -T -q -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null\
 -oPubkeyAuthentication=yes -oPasswordAuthentication=no jwu@10.1.2.2\
 sudo bash -c 'for f in /tmp/echo_server.py.50002.*; do [[ ! -f $f ]] || ( (( ${f##*.} < (($(date +%s)-120)) )) && rm $f ) || exit 1; done; touch /tmp/echo_server.py.50002.$$.$(date +%s);pkill -15 -U jwu -f ".*echo_server.py.* --port 50002";sleep 1;pkill -9 -U jwu -f ".*echo_server.py.* --port 50002";su jwu -c "nohup 0<&- >/dev/null /upthere/bin/loop.sh echo hello &";rm /tmp/echo_server.py.50002.$$.*;'
