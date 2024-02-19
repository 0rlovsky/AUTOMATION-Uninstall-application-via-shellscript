#!/bin/bash  
# Created by Aleksandr Orlov 
# Define the name of the application (DO NOT END WITH .APP)
APP_NAME="#ENTER APP NAME" (EXAMPLE: Slack)

# Check if the application is running
if pgrep -x "$APP_NAME" > /dev/null; then
    # End the application silently
    pkill -f "$APP_NAME" > /dev/null 2>&1
fi

# Define the installation directory
INSTALL_DIR="/Applications"
# Check if the application exists before attempting to uninstall it
if [ -d "$INSTALL_DIR/$APP_NAME.app" ]; then
    # Uninstall the application
    rm -rf "$INSTALL_DIR/$APP_NAME.app"

    # Verify uninstallation
    if [ ! -d "$INSTALL_DIR/$APP_NAME.app" ]; then
        echo "$APP_NAME has been successfully uninstalled."
    else
        echo "Error: Failed to uninstall $APP_NAME."
    fi
else
    echo "$APP_NAME is not installed on this system."
fi