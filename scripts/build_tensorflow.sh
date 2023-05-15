#!/bin/sh

set -ex

sudo apt install -y patchelf

python3 -m venv venv

source venv/bin/activate

export WORKDIR=$(pwd)
export PYTHON_BIN_PATH=$WORKDIR/venv/bin/python3
export PYTHON_LIB_PATH=$WORKDIR/venv/lib/python3.10/site-packages
export ROCM_PATH=/opt/rocm-5.5.0
export TF_NEED_ROCM=1
export GPU_DEVICE_TARGETS=gfx1100

# build tensorflow-rocm

git clone -b r2.10-rocm-enhanced https://github.com/evshiron/tensorflow-rocm

cd tensorflow-rocm

# install bazel in venv
curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.16.0/bazelisk-linux-amd64 -o $WORKDIR/venv/bin/bazel \
  && chmod +x $WORKDIR/venv/bin/bazel

# declare build targets
printf '%s\n' ${GPU_DEVICE_TARGETS} | sudo tee -a $ROCM_PATH/bin/target.lst

# https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/blob/243d98f63f538787b438a15ec0e7cc2f5f9c2d10/tensorflow/tools/ci_build/Dockerfile.rocm#L108
sudo touch $ROCM_PATH/.info/version

pip install setuptools wheel numpy packaging requests

bash build_rocm_python3

cd ..
