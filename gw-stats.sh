#!/bin/bash
# WarpGate gateway stats helper.
# Provides a JSON status snapshot for the dashboard / Telegram bot.
# Safe fallbacks when warp-cli (Cloudflare WARP) is unavailable
# (e.g. running in the Docker monitoring image on a non-Pi host).
set -o pipefail

# Source config for interface names (real Pi install)
if [[ -f /etc/EdgeGateway/config.env ]]; then
    source /etc/EdgeGateway/config.env 2>/dev/null
fi

: "${WAN_IFACE:=eth0}"

if command -v warp-cli &>/dev/null; then
    WARP_STATUS=$(warp-cli status 2>/dev/null | grep -o "Connected\|Disconnected" | head -1)
    WARP_IP=$(warp-cli warp-stats 2>/dev/null | grep "WAN IP" | awk '{print $NF}' || echo "N/A")
else
    WARP_STATUS="Unavailable"
    WARP_IP="N/A"
fi
WARP_STATUS="${WARP_STATUS:-Unknown}"
WARP_IP="${WARP_IP:-N/A}"

CPU=$(top -bn1 2>/dev/null | grep "Cpu(s)" | awk '{printf "%.0f", $2}' || echo "0")

MEM_TOTAL=$(free -m 2>/dev/null | awk '/Mem:/{print $2}' || echo "0")
MEM_USED=$(free -m 2>/dev/null | awk '/Mem:/{print $3}' || echo "0")
if [[ "$MEM_TOTAL" -gt 0 ]]; then
    MEM_PCT=$((MEM_USED * 100 / MEM_TOTAL))
else
    MEM_PCT=0
fi

TEMP="0"
if command -v vcgencmd &>/dev/null; then
    TEMP_RAW=$(vcgencmd measure_temp 2>/dev/null | cut -d= -f2 | cut -d\' -f1)
    [[ -n "$TEMP_RAW" ]] && TEMP="$TEMP_RAW"
else
    if [[ -f /sys/class/thermal/thermal_zone0/temp ]]; then
        TEMP_RAW=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
        TEMP=$(awk "BEGIN {printf \"%.1f\", $TEMP_RAW/1000}")
    fi
fi

UPTIME=$(uptime -p 2>/dev/null | sed 's/up //' || echo "unknown")

RX_TODAY=$(vnstat -i "$WAN_IFACE" --oneline 2>/dev/null | cut -d';' -f10 || echo "N/A")
TX_TODAY=$(vnstat -i "$WAN_IFACE" --oneline 2>/dev/null | cut -d';' -f11 || echo "N/A")
RX_TODAY="${RX_TODAY:-N/A}"
TX_TODAY="${TX_TODAY:-N/A}"

LEASES_FILE="/var/lib/misc/dnsmasq.leases"
if [[ -f "$LEASES_FILE" ]]; then
    CLIENTS=$(wc -l < "$LEASES_FILE" 2>/dev/null || echo "0")
else
    CLIENTS=0
fi

RX1=$(cat /sys/class/net/"$WAN_IFACE"/statistics/rx_bytes 2>/dev/null || echo 0)
TX1=$(cat /sys/class/net/"$WAN_IFACE"/statistics/tx_bytes 2>/dev/null || echo 0)
sleep 1
RX2=$(cat /sys/class/net/"$WAN_IFACE"/statistics/rx_bytes 2>/dev/null || echo 0)
TX2=$(cat /sys/class/net/"$WAN_IFACE"/statistics/tx_bytes 2>/dev/null || echo 0)
RX_RATE=$(( (RX2-RX1) / 1024 ))
TX_RATE=$(( (TX2-TX1) / 1024 ))

python3 -c "
import json, sys
data = {
    'warp': '$WARP_STATUS',
    'warp_ip': '$WARP_IP',
    'cpu': int('$CPU'),
    'mem_pct': int('$MEM_PCT'),
    'mem_used': int('$MEM_USED'),
    'mem_total': int('$MEM_TOTAL'),
    'temp': '$TEMP',
    'uptime': '$UPTIME',
    'clients': int('$CLIENTS'),
    'rx_today': '$RX_TODAY',
    'tx_today': '$TX_TODAY',
    'rx_kbps': int('$RX_RATE'),
    'tx_kbps': int('$TX_RATE'),
}
print(json.dumps(data))
"
