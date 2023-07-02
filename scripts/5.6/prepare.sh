#!/bin/sh

apt update && apt install -y git vim curl build-essential python3-pip python3-venv libpython3-dev libpng-dev libjpeg-dev

curl -O https://repo.radeon.com/amdgpu-install/5.6/ubuntu/jammy/amdgpu-install_5.6.50600-1_all.deb
dpkg -i amdgpu-install_5.6.50600-1_all.deb

DEBIAN_FRONTEND=noninteractive amdgpu-install --usecase=rocm --no-dkms --no-32 -y
