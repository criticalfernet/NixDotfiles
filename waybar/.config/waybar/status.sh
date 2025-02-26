
PLAYER="spotify"
CURRENT=""

STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)

if [[ -z "$STATUS" ]]; then
  echo " "
  exit 0
fi

CURRENT=$(playerctl --player=$PLAYER metadata --format "{{ title }}" | head -c 30)
echo $CURRENT
exit 0


if [ $STATUS == "Playing" ]; then 
  echo $CURRENT
  exit 0
else
  echo $CURRENT
  exit 0
fi
