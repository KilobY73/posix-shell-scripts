#!/bin/sh
builtin_cat() {
  while IFS= read t; do
    printf "%s\n" "$t"
  done < $1
}
alias arr='set --'
while true; do
  wifi=$(builtin_cat /sys/class/net/wlan0/operstate)
  eth=$(builtin_cat /sys/class/net/eth0/operstate)
  arr $(free -h) && mem=$9'/'$8
  arr $(builtin_cat /proc/loadavg) && sys_load=$1
  arr $(df -h /) && disk=${11}
#  battery="$(builtin_cat /sys/class/power_supply/BAT0/status) $(builtin_cat /sys/class/power_supply/BAT0/capacity)%"
#  temp=$(($(builtin_cat /sys/class/thermal/thermal_zone0/temp) / 1000))"°C"
  date=$(date +"%Y-%m-%d %H:%M")
  voldata=$(pacmd list-sinks)
  voldata=${voldata#*'* index:'}
  arr $voldata
  voldevice=$1
  voldata=${voldata#*front-right:}
  arr $voldata
  if [ "${21}" = "no" ]; then
    volume=$3
  else
    volume="Muted"
  fi
  xsetroot -name "W: $wifi | E: $eth | Vol: $voldevice $volume | $sys_load | $mem | $date"
  sleep 5
done
