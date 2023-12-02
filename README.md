# DotFiles

! If you are using Windows, use wsl 2. <br/>

to use wsl 2 <br/>
first go to windows components and activate the Linux for Windows subsystem. <br/>
To check the version use the command wsl --set-version, if you see 1 then you need to write wsl --set-version 2. <br/>
After these procedures you will be able to download any repository from the Microsoft store. <br/>


#Initial setup

```bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install build-essential procps curl file git
```

#Installing Brew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
sudo test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
```

#Installing and configuring zsh

Install Zsh
```bash
brew install zsh
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


Setting dependencies for correct operationi
```bash
brew install gcc
brew install npm
brew install python3
pip3 install virtualenv virtualenvwrapper
```

#Install and setup nvim

```bash
brew install nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
Say yes while install nvcad
