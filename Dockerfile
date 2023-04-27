FROM alpine:latest

# Установка необходимых пакетов
RUN apk add --no-cache zsh git tmux neovim openssh

# Установка oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Копирование конфигурационных файлов
COPY .zshrc /root/
COPY .tmux.conf /root/
COPY .config/nvim/init.vim /root/.config/nvim/

# Настройка SSH
RUN apk add --no-cache openssh && \
    ssh-keygen -A && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Запуск SSH-сервера
CMD ["/usr/sbin/sshd", "-D"]
