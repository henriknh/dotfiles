CONN=$(ping -c 1 8.8.8.8 | grep -i time=)
PING=$(cut -d'=' -f4 <<<"$CONN")
echo $(cut -d'.' -f1 <<<"$PING")ms
