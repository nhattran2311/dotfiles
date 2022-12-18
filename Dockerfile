# docker command
# export UID=$(id -u) && export GID=$(id -g) && docker build --build-arg USER=$USER --build-arg UID=$UID --build-arg GID=$GID -f Dockerfile -t dotfile:latest . && docker run --rm -it dotfile:latest
ARG BASE_IMAGE=ubuntu:latest
from ${BASE_IMAGE}

ARG USER=docker
ARG PW=docker

#RUN apt update -y && apt upgrade -y && apt install -y \
#    git \
#    zsh \
#    neovim \
#    curl \
#    && apt autoclean -y \
#    && apt autoremove -y \
#    && rm -rf /var/lib/apt/lists/*
#
# make bash history persistent
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=~/commandhistory/.bash_history" && \
    mkdir ~/commandhistory && \
    touch ~/commandhistory/.bash_history && \
    echo $SNIPPET >> ~/.bashrc

ENV HOME /home/${USER}
# Add newuser
RUN useradd -rm -d ${HOME} -s /bin/bash ${USER} --uid=${UID} && echo "${USER}:${PW}" |\
    chpasswd

WORKDIR ${HOME}/mnt/data
RUN chown ${UID}:${GID} ${HOME}/mnt/data
USER ${UID}:${GID}

CMD ["/bin/bash"]
