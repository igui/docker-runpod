#!/bin/bash

set -e

if ! [ -v RCLONE_CONFIG_BASE64 ]; then
	echo "RCLONE_CONFIG_BASE64 not set. Omitting auto-config"
	exit 0
fi

echo "Putting rclone config"
mkdir -p ~/.config/rclone/
(echo ${RCLONE_CONFIG_BASE64} | base64 -d) > ~/.config/rclone/rclone.conf

echo "Syncing Dropbox into /workspace/dropbox"
rclone copy dropbox:runpod/ /workspace/dropbox/

echo "Substitute the jupyter config with the one in Dropbox"
rm -rf ~/.jupyter
ln -s /workspace/dropbox/jupyter ~/.jupyter

