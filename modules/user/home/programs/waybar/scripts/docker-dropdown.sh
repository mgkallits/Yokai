#!/bin/sh

# Get detailed information about all containers
CONTAINER_INFO=$(docker ps -a --format "Name: {{.Names}}\nStatus: {{.Status}}\nImage: {{.Image}}\nPorts: {{.Ports}}\nCreated: {{.CreatedAt}}\nID: {{.ID}}\n")

# Display the information in a dropdown menu using wofi (for Wayland)
echo "$CONTAINER_INFO" | wofi --show dmenu --prompt "Docker Containers" --hide-on-focus-lost