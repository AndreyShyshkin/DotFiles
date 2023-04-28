FROM ubuntu:latest

RUN apt-get update

# Настройка доступа по SSH
RUN apt-get -y install openssh-server && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#UsePAM yes/UsePAM no/' /etc/ssh/sshd_config && \
    echo "export VISIBLE=now" >> /etc/profile


# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"

# Открытие порта для SSH
EXPOSE 22

# Запуск SSH сервера
CMD ["/usr/sbin/sshd", "-D"]
