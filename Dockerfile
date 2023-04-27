FROM ubuntu

# Установить пакеты
RUN apt-get update && apt-get install -y \
    zsh \
    neovim \
    tmux \
    openssh-server \
    git \
    curl \
    wget

# Настроить ssh
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo "export VISIBLE=now" >> /etc/profile

# Удалить .zshrc файл и скачать файл из GitHub
RUN rm -f ~/.zshrc
RUN curl -o ~/.zshrc https://raw.githubusercontent.com/AndreyShyshkin/DotFiles/master/.zshrc

# Установить тему и плагины для zsh
RUN git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Установить Oh My Zsh
RUN sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Запустить ssh
CMD ["/usr/sbin/sshd", "-D"]
