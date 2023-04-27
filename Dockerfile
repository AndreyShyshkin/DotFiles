FROM fedora

# Установка zsh, NVIM, tmux
RUN dnf update -y && \
    dnf install -y zsh neovim tmux && \
    dnf clean all

# Настройка доступа по SSH
RUN dnf -y install openssh-server && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#UsePAM yes/UsePAM no/' /etc/ssh/sshd_config && \
    echo "export VISIBLE=now" >> /etc/profile

# Установка темы PowerLevel10K и плагинов для zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc && \
    sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Настройка окружения
RUN echo 'alias vi="nvim"' >> ~/.zshrc && \
    echo 'alias vim="nvim"' >> ~/.zshrc

# Открытие порта для SSH
EXPOSE 22

# Запуск SSH сервера
CMD ["/usr/sbin/sshd", "-D"]
