#!/bin/bash

set -e

# Substitute the $OPENAI_API_KEY$ literal with the env variable
echo "Fixing OPENAI_API_KEY"
sed -i  "s/----change-openai-key----/${OPENAI_API_KEY}/g" ~/.jupyter/jupyter_jupyter_ai_config.json

