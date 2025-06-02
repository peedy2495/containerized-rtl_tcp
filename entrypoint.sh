#!/bin/sh
# Einschalten von Bias-T
echo "[INFO] Bias-T einschalten..."
rtl_biast -b 1

# Kleines Delay (optional)
sleep 2

# Start rtl_tcp
echo "[INFO] Starte rtl_tcp..."
exec rtl_tcp -n 10 -a 0.0.0.0 -p 1234
