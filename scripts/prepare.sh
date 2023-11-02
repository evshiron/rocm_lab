#!/bin/sh

sudo apt-get update && apt-get install -y git vim curl build-essential python3-pip python3-venv libpython3-dev libpng-dev libjpeg-dev
sudo apt-get update && sudo apt-get install -y \
  build-essential \
  clang \
  clang-format \
  clang-tidy \
  cmake
curl -O https://repo.radeon.com/amdgpu-install/5.7.1/ubuntu/jammy/amdgpu-install_5.7.50701-1_all.deb
dpkg -i amdgpu-install_5.7.50701-1_all.deb

DEBIAN_FRONTEND=noninteractive amdgpu-install --usecase=rocm --no-dkms --no-32 -y
