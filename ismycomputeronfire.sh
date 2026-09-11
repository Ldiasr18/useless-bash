#!/usr/bin/env bash

temp=$(cat /sys/class/thermal/thermal_zone0/temp)
temp=$(( (temp + 50) /100))
coffee_mug=$((temp > 550 ? temp - 550 : 550 - temp))
printf "No, it's %d.%d°C\n%d.%d°C %s a 55°C coffee mug\n" "$((temp / 10))" "$((temp % 10))" "$((coffee_mug / 10))" "$((coffee_mug % 10))" "$([[ $temp -lt 550 ]] && echo below || echo above)"
