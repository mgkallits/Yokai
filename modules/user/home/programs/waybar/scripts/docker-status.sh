#!/bin/sh

# Check if Docker is running (system service)
if ! systemctl is-active --quiet docker; then
    echo '{"text": "  Down", "tooltip": "Docker is not running", "class": "down"}'
    exit 0
fi

# Get the status of all containers and summarize
CONTAINER_STATUS=$(docker ps -a --format "{{.Status}}")
RUNNING=$(echo "$CONTAINER_STATUS" | grep -c "Up")
EXITED=$(echo "$CONTAINER_STATUS" | grep -c "Exited")
PAUSED=$(echo "$CONTAINER_STATUS" | grep -c "Paused")
RESTARTING=$(echo "$CONTAINER_STATUS" | grep -c "Restarting")
HEALTHY=$(docker ps --filter "health=healthy" --format "{{.ID}}" | wc -l)
UNHEALTHY=$(docker ps --filter "health=unhealthy" --format "{{.ID}}" | wc -l)

# Generate the summary for the tooltip
SUMMARY="Running: $RUNNING\nExited: $EXITED\nPaused: $PAUSED\nRestarting: $RESTARTING\nHealthy: $HEALTHY\nUnhealthy: $UNHEALTHY"

# Display Docker status and container info
echo '{"text": "  Up", "tooltip": "'"$SUMMARY"'", "class": "up"}'