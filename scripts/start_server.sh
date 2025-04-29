#!/bin/bash
cd /home/ubuntu/node-app

# Kill any running node processes on the default port (optional safety)
fuser -k 3000/tcp || true

# Start in background with nohup
nohup node app.js > app.log 2>&1 &
