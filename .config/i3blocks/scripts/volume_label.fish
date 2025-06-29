#!/usr/bin/fish

set volume (pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n 1 | tr -d '%')

if test $volume -eq 0
  echo "  $volume%"
else if test $volume -le 50
  echo " $volume%"
else
  echo "  $volume%"
end

