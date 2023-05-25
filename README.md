
![badge-torch-gfx1100](https://shields.io/github/actions/workflow/status/evshiron/rocm_lab/build-rocm5.5-torch2.0-wheels.yaml?label=torch2.0) ![badge-tensorflow-gfx1100](https://shields.io/github/actions/workflow/status/evshiron/rocm_lab/build-rocm5.5-tensorflow2.10-wheels.yaml?label=tensorflow2.10) ![badge-torchvision-gfx1100](https://shields.io/github/actions/workflow/status/evshiron/rocm_lab/build-rocm5.5-torchvision0.15-wheels.yaml?label=torchvision0.15) ![badge-torchaudio-gfx1100](https://shields.io/github/actions/workflow/status/evshiron/rocm_lab/build-rocm5.5-torchaudio2.0-wheels.yaml?label=torchaudio2.0) ![rocm_lab-downloads](https://shields.io/github/downloads/evshiron/rocm_lab/total)

# ROCm LAB

Experiments to see the potential of RX 7000 series.

## Motivations

As we know, ROCm 5.5.0 was released on May 2nd, 2023. After waiting for several days, we discovered that all official Docker images did not include support for the RX 7000 series (a.k.a. gfx1100), which are currently the best-performing and most suitable consumer-grade GPUs for the AI field under the AMD brand. As we aim to tap into the potential of RX 7000 series GPUs as soon as possible:

[ROCm LAB](https://github.com/evshiron/rocm_lab) will focus on conducting proof of concept and delivering prebuilt wheels specifically for the RX 7000 series until official support is provided. The goal of these efforts is to demonstrate the viability and effectiveness of using these GPUs for AI applications and to provide a basis for further development.

Additionally, the website [Are we gfx1100 yet?](https://evshiron.github.io/are-we-gfx1100-yet/) will serve as a platform for showcasing the latest proof of concept developments in the AI field using the RX 7000 series.

## Prebuilt wheels

Prebuilt wheels are built by [GitHub Actions](https://github.com/evshiron/rocm_lab/actions) and can now be found in [GitHub Releases](https://github.com/evshiron/rocm_lab/releases).

It's worth noting that these wheels are built using GitHub's `ubuntu-latest` runner, which is Ubuntu 22.04 right now. There might be dynamic linking issues when used in other systems. If it does, consider building a Docker container instead.

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
docker run -ti --net=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --device=/dev/kfd --device=/dev/dri --group-add video --ipc=host --shm-size 8G -e HSA_OVERRIDE_GFX_VERSION=11.0.0 --name rocm5.5-automatic ghcr.io/evshiron/rocm_lab:rocm5.5-automatic
```

## Are we gfx1100 yet?

* https://are-we-gfx1100-yet.github.io/
