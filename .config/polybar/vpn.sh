ICON="  "
UP=$(pgrep -x openvpn)
if [ "$UP" != "" ]
then
  CONN=$(nmcli con show --active | grep -i vpn)
  NAME=$(cut -d' ' -f1 <<<"$CONN")
  echo $ICON $NAME
else
  echo ""
fi
