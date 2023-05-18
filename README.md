
![badge-torch-gfx1100](https://shields.io/github/actions/workflow/status/evshiron/rocm_lab/build-rocm5.5-torch2.0-wheels.yaml?label=torch2.0) ![badge-torchvision-gfx1100](https://shields.io/github/actions/workflow/status/evshiron/rocm_lab/build-rocm5.5-torchvision0.15-wheels.yaml?label=torchvision0.15) ![badge-tensorflow-gfx1100](https://shields.io/github/actions/workflow/status/evshiron/rocm_lab/build-rocm5.5-tensorflow2.10-wheels.yaml?label=tensorflow2.10)

# ROCm LAB

Experiments to see the potential of RX 7000 series.

## Prebuilt wheels

Prebuilt wheels can now be found in [GitHub Releases](https://github.com/evshiron/rocm_lab/releases).

### How to use

Simple download the wheel you want and install it with:

```bash
# recommended: activate venv
source venv/bin/activate

# download the wheel
curl -L -O https://github.com/evshiron/rocm_lab/releases/download/v1.14.514/torch-2.0.1+gite19229c-cp310-cp310-linux_x86_64.whl

# install the wheel
pip install torch-2.0.1+gite19229c-cp310-cp310-linux_x86_64.whl
```

## Prebuilt Docker images

* https://github.com/evshiron/rocm_lab/pkgs/container/rocm_lab
  * rocm5.5-ub22.04-base
  * rocm5.5-ub22.04-torch2.0.1
  * rocm5.5-ub22.04-a1111-webui
  * rocm5.5-ub22.04-automatic

These Docker images are mainly proofs of concepts and will not be updated frequently.

It's recommended to use the wheels above directly, or build your own Docker images with these wheels if you like.

### How to use

```bash
# add environment variables or volumes for your need
docker run -ti --net=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --device=/dev/kfd --device=/dev/dri --group-add video --ipc=host --shm-size 8G --name rocm5.5-automatic ghcr.io/evshiron/rocm_lab:rocm5.5-automatic
```

## Are we gfx1100 yet?

* https://evshiron.github.io/are-we-gfx1100-yet/
