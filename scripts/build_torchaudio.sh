#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export ROCM_PATH=/opt/rocm-6.0.0
export PYTORCH_ROCM_ARCH=gfx1100

# build torchvision

git clone --recursive -b release/2.2 https://github.com/pytorch/audio torchaudio

cd torchaudio
git reset --hard
# not needed for this version
#echo 2.0.2 > version.txt

# this file is required but is missing in rocm distribution
echo 6.0.0 | sudo tee -a $ROCM_PATH/.info/version-dev

pip install setuptools wheel cmake ninja 

git apply ../patches/torchaudio.diff

python setup.py bdist_wheel

cd ..
