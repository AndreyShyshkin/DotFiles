# DotFiles
Before starting a little instruction how I have configured my working environment: 
  All my development goes on a remote Ubuntu server (you can use any service that provides you to connect to it via ssh) I use a remote server for several reasons, the main is access to development from any point where there is an Internet and always infused and ready for a robot environment on any device.


The terminal I use is Hyper, why it's one of the reasons is that it's fast and cross-platform.
On the remote server I use zsh, tmux, nvim

settings Hyper Theme:
```bash
plugins: ['hyper-dracula'],
```

setup to Linux Ubuntu

start 

Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew To Path
```bash
      test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
      test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
      echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
      ```

add to "~/.zshrc"
```bash
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"
```

Install Git
```bash
brew install git
```

Install Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install PowerLevel10K Theme for Oh My Zsh
```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Now that it's installed, open the "~/.zshrc" file with your preferred editor and change the value of "ZSH_THEME" as shown below:
```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

To reflect this change on your terminal, restart it or run this command
```bash
source ~/.zshrc
```

Install Meslo Nerd Font
Install the font by pressing "y"

add fonts to hyper 
```bash
fontFamily: 'MesloLGS NF,
```

Configure PowerLevel10K
Restart Hyper should now be seeing the PowerLevel10K configuration process. If you don't, run the following:
```bash
p10k configure
```

Install ZSH Plugins
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Open the "~/.zshrc" file in your desired editor and modify the plugins line to what you see below.
```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
```

Load these new plugins by running:
```bash
source ~/.zshrc
```
