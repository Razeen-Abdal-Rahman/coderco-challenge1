#!/bin/bash

# Healthcheck for coderco-app
if ! curl --fail http://localhost:8080 > /dev/null 2>&1; then
  echo "$(date): Service not responding, restarting..." >> /var/log/coderco-app.log
  systemctl restart coderco-app
fi
