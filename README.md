# DotFiles

**Note:** If you are using Windows, make sure to use WSL 2.

To enable WSL 2:
1. Go to Windows components and activate the Linux for Windows subsystem.
2. Check the WSL version using the command `wsl --set-version`. If the version is 1, use the command `wsl --set-version 2`.
3. After these procedures, you will be able to download any repository from the Microsoft Store.

If you want to edit the default directory, open `.bashrc`:

```bash
vim .bashrc
```

Navigate to the end and add:

```bash
cd YOURPATH
```

For Windows path: `/mnt/YOURDISC/`

## Initial setup

```bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install build-essential procps curl file git
```

## Installing Brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
sudo test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
```

## Installing and configuring Zsh

### Install Zsh

```bash
brew install zsh
```

### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install PowerLevel10K Theme for Oh My Zsh

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Edit the "~/.zshrc" file:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### Configure PowerLevel10K

Restart Hyper, and you should see the PowerLevel10K configuration process. If not, run:

```bash
p10k configure
```

### Install Zsh Plugins

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Edit the "~/.zshrc" file:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
```

Load the new plugins:

```bash
source ~/.zshrc
```

### Setting dependencies for correct operation

```bash
brew install gcc
brew install npm
brew install python3
pip3 install virtualenv virtualenvwrapper
```

## Install and setup Neovim (nvim)

```bash
brew install nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

During the installation of NvChad, answer "yes."
