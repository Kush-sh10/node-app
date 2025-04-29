#!/bin/bash

if [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Dev-Group" ]]; then
    TARGET_DIR="/home/ubuntu/my-app-dev"
elif [[ "$DEPLOYMENT_GROUP_NAME" == "MyApp-Prod-Group" ]]; then
    TARGET_DIR="/home/ubuntu/my-app-prod"
fi

# Copy from temp to target
cp -r /home/ubuntu/app_temp/* "$TARGET_DIR"

cd "$TARGET_DIR"
npm install
