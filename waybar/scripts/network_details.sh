#!/usr/bin/env bash
set -euo pipefail
have() { command -v "$1" >/dev/null 2>&1; }
join_by() { local IFS="$1"; shift; echo "$*"; }
iface=""; ntype=""
if have nmcli; then
  while IFS=: read -r dev typ state; do
    if [[ "$state" == "connected" ]]; then
      iface="$dev"; ntype="$typ"; break
    fi
  done < <(nmcli -t -f DEVICE,TYPE,STATE device status)
fi
if [[ -z "$iface" ]]; then
  iface=$(ip route 2>/dev/null | awk '/^default/ {print $5; exit}') || true
  if [[ -n "$iface" && -e "/sys/class/net/$iface/wireless" ]]; then
    ntype="wifi"
  elif [[ -n "$iface" ]]; then
    ntype="ethernet"
  else
    ntype="other"
  fi
fi
ip4=""; gw4=""; dns_list=()
if [[ -n "${iface}" ]]; then
  ip4=$(ip -4 addr show dev "$iface" 2>/dev/null | awk '/inet /{print $2}' | head -n1)
  gw4=$(ip route 2>/dev/null | awk -v IF="$iface" '$1=="default" && $5==IF {print $3; exit}')
  if have resolvectl; then
    while read -r _ server; do
      [[ -n "$server" ]] && dns_list+=("$server")
    done < <(resolvectl dns "$iface" 2>/dev/null | awk '{print $2}')
  fi
  if [[ ${#dns_list[@]} -eq 0 && -r /etc/resolv.conf ]]; then
    while read -r maybe ip; do
      if [[ "$maybe" == "nameserver" && -n "$ip" ]]; then dns_list+=("$ip"); fi
    done < /etc/resolv.conf
  fi
fi
title="Network"
details=()
icon="network-transmit-receive-symbolic"
if [[ "$ntype" == "wifi" ]]; then
  title="Wi‑Fi"
  icon="network-wireless-symbolic"
  ssid=""; signal_dbm=""; chan=""; rate=""; freq=""
  if have nmcli; then
    IFS=: read -r _ ssid bssid chan rate signal _ < <(nmcli -t -f ACTIVE,SSID,BSSID,CHAN,RATE,SIGNAL dev wifi | awk -F: '$1=="yes"{print; exit}') || true
    [[ -n "${ssid:-}" ]] && details+=("SSID: $ssid")
    [[ -n "${chan:-}" ]] && details+=("Channel: $chan")
    [[ -n "${rate:-}" ]] && details+=("Rate: $rate")
    [[ -n "${signal:-}" ]] && details+=("Signal: ${signal}%")
  fi
  if have iw; then
    iw_out=$(iw dev "$iface" link 2>/dev/null || true)
    if [[ -n "$iw_out" ]]; then
      rssi=$(awk -F': ' '/signal:/ {gsub(" dBm","",$2); print $2}' <<<"$iw_out" | head -n1)
      br=$(awk -F': ' '/tx bitrate:/ {print $2}' <<<"$iw_out" | head -n1)
      fr=$(awk -F': ' '/freq:/ {print $2}' <<<"$iw_out" | head -n1)
      [[ -n "${rssi:-}" ]] && details+=("RSSI: ${rssi} dBm")
      [[ -n "${br:-}" ]] && details+=("TX bitrate: ${br}")
      [[ -n "${fr:-}" ]] && details+=("Freq: ${fr} MHz")
    fi
  fi
elif [[ "$ntype" == "ethernet" ]]; then
  title="Ethernet"
  icon="network-wired-symbolic"
  if have ethtool; then
    spd=$(ethtool "$iface" 2>/dev/null | awk -F': ' '/Speed:/ {print $2; exit}') || true
    [[ -n "${spd:-}" ]] && details+=("Speed: $spd")
  fi
else
  [[ -n "$iface" ]] && details+=("Interface: $iface")
fi
[[ -n "$iface" ]] && details+=("Device: $iface")
[[ -n "$ip4" ]] && details+=("IPv4: $ip4")
[[ -n "$gw4" ]] && details+=("Gateway: $gw4")
if [[ ${#dns_list[@]} -gt 0 ]]; then
  details+=("DNS: $(join_by ', ' "${dns_list[@]}")")
fi
if [[ ${#details[@]} -eq 0 ]]; then
  body="No additional details available."
else
  body=$(join_by $'\n' "${details[@]}")
fi
if have notify-send; then
  notify-send --app-name="Waybar" --icon="$icon" --category="device" "${title} details" "$body"
else
  echo -e "${title} details\n$body"
fi