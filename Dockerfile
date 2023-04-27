FROM ubuntu

# Обновление пакетов Ubuntu
RUN apt-get update && apt-get upgrade -y

# Установка Homebrew
RUN apt-get install -y curl git
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
RUN test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
RUN test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
RUN echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

# Установка zsh и необходимых тем и плагинов
RUN brew install zsh
RUN git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
RUN sed -i 's/plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Установка nvim
RUN apt-get install -y neovim

CMD ["zsh"]
