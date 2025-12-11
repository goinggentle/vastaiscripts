#!/bin/bash

# H100
# 120GB
# vastai/pytorch:2.7.0-cuda-12.8.1-py310-22.04

touch ~/.no_auto_tmux
cd /workspace
git clone https://github.com/MeiGen-AI/InfiniteTalk.git
cd InfiniteTalk

pip install -U xformers==0.0.30
pip install misaki[en]
pip install ninja 
pip install psutil 
pip install packaging
pip install wheel
pip install flash_attn==2.7.4.post1
pip install -r requirements.txt
pip install librosa
pip install hf-transfer
pip install transformers==4.52.4

hf download Wan-AI/Wan2.1-I2V-14B-480P \
    --local-dir ./weights/Wan2.1-I2V-14B-480P
hf download TencentGameMate/chinese-wav2vec2-base \
    --local-dir ./weights/chinese-wav2vec2-base
hf download TencentGameMate/chinese-wav2vec2-base model.safetensors \
    --revision refs/pr/1 \
    --local-dir ./weights/chinese-wav2vec2-base
wget -O weights/Wan2.1_I2V_14B_FusionX_LoRA.safetensors \
    "https://huggingface.co/vrgamedevgirl84/Wan14BT2VFusioniX/resolve/main/FusionX_LoRa/Wan2.1_I2V_14B_FusionX_LoRA.safetensors"
mkdir -p /weights/InfiniteTalk/multi
wget -O weights/InfiniteTalk/multi/infinitetalk.safetensors \
    "https://huggingface.co/MeiGen-AI/InfiniteTalk/resolve/main/multi/infinitetalk.safetensors"
