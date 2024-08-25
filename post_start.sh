#!/bin/bash

set -e

# Tail jupyter logs
tail_logs() {
   # Sleep a bit before setting logs
   sleep 2
   tail -f /jupyter.log &
}

sync_dropbox() {
   while true; do
      # Sleep 30 seconds before syncing
      sleep 30
      echo "Syncing Dropbox into /workspace/dropbox"
      rclone sync /workspace/dropbox/ jupyter-dropbox:runpod/
      echo "Syncing done. Sleeping for 30 seconds"
   done
}

tail_logs & sync_dropbox &
