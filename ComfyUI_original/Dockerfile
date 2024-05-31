FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime

RUN --mount=type=cache,target=/var/cache/apt \
    set -eu \
    && apt-get update
RUN apt-get install -y git curl aria2 coreutils

RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade pip

WORKDIR /ComfyUI

# Clone Main Repo
RUN --mount=type=cache,target=/root/.cache/pip \
    git clone https://github.com/comfyanonymous/ComfyUI.git . && \
    rm models -rf && \
    pip install -r ./requirements.txt

# Set the working directory
COPY common_files/* .
COPY *.* .
CMD ["bash", "entrypoint.sh"]
