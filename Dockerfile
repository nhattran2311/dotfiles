# docker command
# export CONTAINER_UID=$(id -u) && export CONTAINER_GID=$(id -g) && export CONTAINER_USER=$(whoami) && docker build --build-arg DockerUSER=${CONTAINER_USER} --build-arg DockerUID=${CONTAINER_UID} --build-arg DockerGID=${CONTAINER_GID} -f Dockerfile -t dotfile . && docker run --rm -it dotfile
ARG BASE_IMAGE=ubuntu:20.04
FROM $BASE_IMAGE as dotifle

ARG DockerUSER=hori
ARG DockerUID=1995
ARG DockerGID=1995

USER root

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && env
ENV DEBIAN_FRONTEND=noninteractive

# change shell
SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

RUN \
    apt-get update && \
    apt-get install -y \
    # install project specific tools
    sudo \
    git \
    zsh \
    vim \
    curl \
    wget \
    # package for nvim
    fuse \
    # package for exa
    build-essential \
    python3-pip \
    # pynvim \
    nodejs \
    xclip \
    zip \
    tofrodos \
    ripgrep \
    tmux \
    && rm -rf /var/lib/apt/lists/*


# Add newuser
RUN \
    groupadd --gid=${DockerGID} ${DockerUSER} && \
    useradd --no-log-init --create-home ${DockerUSER} --uid=${DockerUID} --gid=${DockerGID} \
    && mkdir -p /etc/sudoers.d/ \
    && echo ${DockerUSER} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${DockerUSER} \
    && chmod 0440 /etc/sudoers.d/${DockerUSER} \
    && chmod 777 /tmp/
    # echo "${DockerUSER}:${DockerPW}" | chpasswd && \
    # usermod -aG sudo ${DockerUSER} && \
    # workaround for latest security fix where secondary groups arn mot working with sudo
    # echo "$DockerUSER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER ${DockerUID}:${DockerGID}

RUN echo "APT::Get::Assume-Yes=yes" > /tmp/_tmp_apt.conf \
    && export APT_CONFIG=/tmp/_tmp_apt.conf

# RUN git clone https://github.com/nhattran2311/dotfile.git /home/${DockerUSER}/dotfile
# WORKDIR /home/${DockerUSER}/dotfile

# Get Rust
# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# RUN source "$HOME/.cargo/env"


# NEOVIM
# RUN cp .zshrc ~/.zshrc && mkdir -p ~/.config/nvim/ && cp -r .config/nvim/* ~/.config/nvim
# RUN mkdir -p ~/.local/share/nvim && wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim.appimage -P ~/.local/share/nvim/
# RUN chmod u+x ~/.local/share/nvim/nvim.appimage && ~/.local/share/nvim/nvim.appimage
# RUN mkdir -p ~/.local/bin && ln -s $HOME/.local/share/nvim/nvim.appimage ~/.local/bin/nvim
# RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
#     ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ZSH STARSHIP FZF
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# RUN curl -sS https://starship.rs/install.sh | sh -s -- -y
# RUN cp .config/starship.toml ~/.config/starship.toml
# RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# change shell
# SHELL ["/bin/zsh", "-euxo", "pipefail", "-c"]
# RUN cargo install exa

ENTRYPOINT [ "/bin/bash", "-il", "-c"]
CMD ["/bin/bash", "-il"]

