FROM "ubuntu:20.04"

RUN apt update && apt install -y g++ gdb zsh wget git curl vim manpages-dev manpages-posix-dev man

# RUN apt install -y locales
# RUN rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
# ENV LANG en_US.utf8

RUN chsh -s $(which zsh) root

WORKDIR /root

RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.0-rc3/cmake-3.21.0-rc3-linux-x86_64.sh

RUN echo -en "Y\n" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

RUN sed -i "s/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g; s/^ZSH_THEME=.*/ZSH_THEME=\"itchy\"/g" $HOME/.zshrc

RUN mkdir -p opt/cmake && \
    chmod +x cmake-3.21.0-rc3-linux-x86_64.sh && \
   ./cmake-3.21.0-rc3-linux-x86_64.sh --prefix=/root/opt/cmake --skip-license && \
   rm ./cmake-3.21.0-rc3-linux-x86_64.sh

CMD [ "zsh" ]
