FROM "amazonlinux:latest"

RUN yum install -y cmake3 gdb gcc-c++ zsh wget git curl vim manpages-dev manpages-posix-dev man util-linux-user \
      tar zip unzip tcpdump iputils procps

RUN chsh -s `command -v zsh` root

WORKDIR /root

RUN git clone https://github.com/winter-loo/vimrc.git && mv vimrc/plain_vimrc $HOME/.vimrc && rm -fr vimrc

RUN echo -en "Y\n" | sh -c "`curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh`"
 
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  
RUN sed -i "s/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g; s/^ZSH_THEME=.*/ZSH_THEME=\"itchy\"/g" $HOME/.zshrc
 
CMD [ "zsh" ]
