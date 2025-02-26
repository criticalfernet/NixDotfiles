
THEME="$HOME/.config/rofi/powermenu.rasi"
OPTION=$(echo "Cancel^Lock^Sleep^Restart^Poweroff" | rofi -dmenu -sep '^' -config $THEME)
#echo "$OPTION"
if [ "$OPTION" == "Lock" ]; then
  hyprlock
  exit 0
elif [ "$OPTION" == "Sleep" ]; then
  systemctl suspend
  exit 0
elif [ "$OPTION" == "Restart" ]; then
  systemctl reboot
  exit 0
elif [ "$OPTION" == "Poweroff" ]; then
  systemctl poweroff
  exit 0
else
  exit 1
fi
