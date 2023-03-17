# Config of Neovim
This is my day to day config of Neovim. Neovim is a great and customizable terminal based editor. All the plugins are set up so that there can be a simple transition from VS-Code to Neovim. I have used lazy plugin for managing other plugin and mason plugin for managing different Lsp.

### Install Neovim
You can install a current major version of neovim with your package manager like brew, apt, pacman, etc.

### Clone the Repo
`git clone https://github.com/abhinaya-aryal/nvim_config.git ~/.config/nvim`
After cloning the repo, run `nvim` command and wait for all the plugins to be installed.

### Setting up Font
There are many glymph and icons that are being used by different plugins. These icons work only when the "Nerd Font" is provided as a terminal font or nvim font.

### Check health
Run `nvim` and enter
`:checkhealth`
And then press enter..

### Fixing Issues
Let's fix the copy paste,
- On mac, `pbcopy` should be builtin
- On linux, `wl-clipboard` should be installed (for wayland)
- Neovim python support `pip install pynvim`
- Neovim node support `npm i -g neovim` 
- `ripgrep` needs to be available on the system
