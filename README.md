# DotFiles

**Note:** If you are using Windows, ensure WSL 2 is set up.

To enable WSL 2:

1. Go to Windows components and activate the Linux for Windows subsystem.
2. Check the WSL version using `wsl --set-version`. If it's 1, use `wsl --set-version 2`.
3. After these steps, download any repository from the Microsoft Store.

Optinal


<details>
  <summary>To customize the default directory, </summary>open `.bashrc`:

```bash
vim .bashrc
```

Go to the end and add:

```bash
cd YOURPATH
```

For Windows path: `/mnt/YOURDISC/`.

Alternatively, to connect your Windows disk/folder:

```bash
sudo vim /etc/wsl.conf
```

Add:

```bash
[automount]
options = "metadata,umask=22,fmask=11"
```

Then open:

```bash
sudo vim /etc/fstab
```

Add:

```bash
F: /home/dev/DevDisc drvfs defaults,metadata,uid=1000,gid=1000,umask=022 0 0
```
</details>


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

Edit "~/.zshrc":

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### Configure PowerLevel10K

Restart Hyper or run:

```bash
p10k configure
```

### Install Zsh Plugins

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Edit "~/.zshrc":

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
```

Load new plugins:

```bash
source ~/.zshrc
```

### Setting up dependencies

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

During NvChad installation, answer "yes."

Feel free to fork and adapt these dotfiles according to your preferences. Happy coding! 🚀
