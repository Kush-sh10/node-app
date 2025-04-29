#!/bin/bash

if [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Dev-Group" ]]; then
    APP_DIR="/home/ubuntu/my-app-dev"
    PORT=3001
elif [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Prod-Group" ]]; then
    APP_DIR="/home/ubuntu/my-app-prod"
    PORT=3000
fi

cd "$APP_DIR"

# Stop existing app if running (example: node server)
fuser -k $PORT/tcp || true

# Start app
nohup npm start > server.log 2>&1 &
