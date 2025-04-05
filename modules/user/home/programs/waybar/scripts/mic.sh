#!/bin/sh

# Check if any audio device is in use
grep owner_pid /proc/asound/card1/pcm0c/sub0/status > /dev/null 2>&1

# Check the exit status of the grep command
if [ $? -eq 0 ]; then
    exit 0  # Audio device is in use
else
    exit 1  # No audio device is in use
fi