#turning off input blocking mode
if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi

while [ "x$keypress" = "x" ]; do
  let count+=1
  echo -ne $count'\r'
  keypress="`cat -v`"
  clear
  df -l
  sleep .5
done

#turning input blocking mode back on
if [ -t 0 ]; then stty sane; fi

exit 0
