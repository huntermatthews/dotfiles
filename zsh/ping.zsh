hping() 
{ 
  ping -c 1 -w 2 1>/dev/null 2>&1 $1 && echo $1 up || echo $1 DOWN 
}
