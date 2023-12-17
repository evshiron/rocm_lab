#!/bin/sh

set -ex

sudo apt install -y patchelf

sudo apt-get update && sudo apt-get install -y openjdk-8-jdk openjdk-8-jre unzip wget git libstdc++-12-dev
python3 -m venv venv
python3 -m pip install --upgrade pip

source venv/bin/activate


wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 17


export WORKDIR=$(pwd)
export PYTHON_BIN_PATH=$WORKDIR/venv/bin/python3
export PYTHON_LIB_PATH=$WORKDIR/venv/lib/python3.11/site-packages
export ROCM_PATH=/opt/rocm-6.0.0
export TF_NEED_ROCM=1
export GPU_DEVICE_TARGETS=gfx1100

# build tensorflow-rocm

if [ -d "tensorflow-upstream" ]; then
    echo "tensorflow-upstream folder exists. Skipping git clone."
else
    git clone --recursive https://github.com/ROCmSoftwarePlatform/tensorflow-upstream
fi
cd tensorflow-upstream

# install bazel in venv
curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.19.0/bazelisk-linux-amd64 -o $WORKDIR/venv/bin/bazel \
  && chmod +x $WORKDIR/venv/bin/bazel

bazel clean --expunge

# declare build targets
printf '%s\n' ${GPU_DEVICE_TARGETS} | sudo tee -a $ROCM_PATH/bin/target.lst

# https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/blob/243d98f63f538787b438a15ec0e7cc2f5f9c2d10/tensorflow/tools/ci_build/Dockerfile.rocm#L108
sudo touch $ROCM_PATH/.info/version

pip install setuptools wheel numpy packaging requests

bash build_rocm_python3

cd ..
