#!/bin/bash

# Create necessary directories
mkdir -p /ComfyUI/models/checkpoints/sd15 /ComfyUI/models/clip_vision /ComfyUI/models/ipadapter /ComfyUI/models/loras

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
download_file https://huggingface.co/Eata/SD1.5/resolve/main/020.realisticVisionV51_v51VAE.safetensors /ComfyUI/models/checkpoints/sd15/realisticVisionV51_v51VAE.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors /ComfyUI/models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors /ComfyUI/models/clip_vision/CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors /ComfyUI/models/ipadapter/ip-adapter_sd15.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light_v11.bin /ComfyUI/models/ipadapter/ip-adapter_sd15_light_v11.bin
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors /ComfyUI/models/ipadapter/ip-adapter-plus_sd15.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors /ComfyUI/models/ipadapter/ip-adapter-plus-face_sd15.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors /ComfyUI/models/ipadapter/ip-adapter-full-face_sd15.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_vit-G.safetensors /ComfyUI/models/ipadapter/ip-adapter_sd15_vit-G.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors /ComfyUI/models/ipadapter/ip-adapter_sdxl_vit-h.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors /ComfyUI/models/ipadapter/ip-adapter-plus_sdxl_vit-h.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors /ComfyUI/models/ipadapter/ip-adapter-plus-face_sdxl_vit-h.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors /ComfyUI/models/ipadapter/ip-adapter_sdxl.safetensors
download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light.safetensors /ComfyUI/models/ipadapter/ip-adapter_sd15_light.safetensors
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15.bin /ComfyUI/models/ipadapter/ip-adapter-faceid_sd15.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin /ComfyUI/models/ipadapter/ip-adapter-faceid-plusv2_sd15.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait-v11_sd15.bin /ComfyUI/models/ipadapter/ip-adapter-faceid-portrait-v11_sd15.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl.bin /ComfyUI/models/ipadapter/ip-adapter-faceid_sdxl.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin /ComfyUI/models/ipadapter/ip-adapter-faceid-plusv2_sdxl.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl.bin /ComfyUI/models/ipadapter/ip-adapter-faceid-portrait_sdxl.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl_unnorm.bin /ComfyUI/models/ipadapter/ip-adapter-faceid-portrait_sdxl_unnorm.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plus_sd15.bin /ComfyUI/models/ipadapter/ip-adapter-faceid-plus_sd15.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sd15.bin /ComfyUI/models/ipadapter/ip-adapter-faceid-portrait_sd15.bin
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15_lora.safetensors /ComfyUI/models/loras/ip-adapter-faceid_sd15_lora.safetensors
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15_lora.safetensors /ComfyUI/models/loras/ip-adapter-faceid-plusv2_sd15_lora.safetensors
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl_lora.safetensors /ComfyUI/models/loras/ip-adapter-faceid_sdxl_lora.safetensors
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl_lora.safetensors /ComfyUI/models/loras/ip-adapter-faceid-plusv2_sdxl_lora.safetensors
download_file https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plus_sd15_lora.safetensors /ComfyUI/models/loras/ip-adapter-faceid-plus_sd15_lora.safetensors

