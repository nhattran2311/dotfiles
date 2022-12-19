# docker command
# export UID=$(id -u) && export GID=$(id -g) && docker build --build-arg USER=$USER --build-arg UID=$UID --build-arg GID=$GID -f Dockerfile -t dotfile:latest . && docker run --rm -it dotfile:latest
ARG BASE_IMAGE=ubuntu:latest
from ${BASE_IMAGE}

ARG DockerUSER=Hori
ARG DockerUID=1984
ARG DockerGID=1984
ARG DockerPW=docker

# change shell
SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN apt update -y && apt upgrade -y && apt install -y \
    git \
    zsh \
    neovim \
    curl \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# make bash history persistent
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=~/commandhistory/.bash_history" && \
    mkdir ~/commandhistory && \
    touch ~/commandhistory/.bash_history && \
    echo $SNIPPET >> ~/.bashrc

# Add newuser
RUN groupadd --gid=${DockerGID} ${DockerUSER} && \
    useradd --no-log-init --create-home ${DockerUSER} --uid=${DockerUID} --gid=${DockerGID} && \ && echo "${USER}:${PW}" |\
    chpasswd && \
    usermod -aG sudo ${DockerUSER} && \
    echo "$DockerUSER ALL=(ALL:ALL) ALL" >> /etc/sudoers

RUN chown ${UID}:${GID} ${HOME}/mnt/data
USER ${DockerUID}:${DockerGID}
WORKDIR /home/${DockerUSER}

ENTRYPOINT [ "/bin/bash", "-il", "-c"]
CMD ["/bin/bash", "-il"]

