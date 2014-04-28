cat log | grep -a MEMMOV | grep NOOP | cut -d' ' -f 7 | paste -s -d+ | bc
