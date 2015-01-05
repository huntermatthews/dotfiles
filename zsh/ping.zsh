hping() { ping -c 1 -t 2 2>/dev/null 1>&2 $1 && echo $1 up || echo $1 DOWN }
