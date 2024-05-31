#!/bin/bash

# Create necessary directories
mkdir -p /ComfyUI/models/checkpoints

# Exit immediately if a command exits with a non-zero status
set -e

# Function to download files with retries
download_file() {
    url=$1
    output=$2
    # Check if the file already exists
    if [ -f "$output" ]; then
        echo "File $output already exists, skipping download."
        return
    fi    
    for i in {1..100}; do
        timeout 300 aria2c -x 3 -d "$(dirname "$output")" -o "$(basename "$output")" "$url" && break || sleep 1
    done
}

download_file https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors /ComfyUI/models/checkpoints/sd15/v1-5-pruned-emaonly.safetensors