# Config of Neovim
This is my day to day config of Neovim. Neovim is a great and customizable terminal based editor. All the plugins are set up so that there can be a simple transition from VS-Code to Neovim. I have used lazy plugin for managing other plugin and mason plugin for managing different Lsp.

## Install Neovim
You can install a current major version of neovim with your package manager like brew, apt, pacman, etc.

## Clone the Repo
`git clone https://github.com/abhinaya-aryal/nvim_config.git ~/.config/nvim`
After cloning the repo, run `nvim` command and wait for all the plugins to be installed.

## Setting up Font
There are many glymph and icons that are being used by different plugins. These icons work only when the "Nerd Font" is provided as a terminal font or nvim font.

## Check health
Run `nvim` and enter
`:checkhealth`
And then press enter..

## Fixing Issues
- On mac, `pbcopy` should be builtin
- On linux, `wl-clipboard` should be installed (for wayland)
- Neovim python support `pip install pynvim`
- Neovim node support `npm i -g neovim` 
- `ripgrep` needs to be available on the system

## Integrated Plugins
- [alpha-nvim] (https://www.github.com/goolord/alpha-nvim)
- [nvim-autopairs] (https://github.com/windwp/nvim-autopairs)
- [nvim-ts-autotag] (https://github.com/windwp/nvim-ts-autotag)
- [indent-blanklilne.nvim] (https://github.com/lukas-reineke/indent-blankline.nvim)
- [vim-bbye] (https://github.com/moll/vim-bbye)
- [bufferline.nvim] (https://github.com/akinsho/bufferline.nvim)
- [nvim-cmp] (https://github.com/hrsh7th/nvim-cmp)
- [nvim-colorizer.lua] (https://github.com/NvChad/nvim-colorizer.lua)
- [tokyonight.nvim] (https://github.com/folke/tokyonight.nvim)
- [Comment.nvim] (https://github.com/numToStr/Comment.nvim)
- [diffview.nvim] (https://github.com/sindrets/diffview.nvim)
- [gitsigns.nvim] (https://github.com/lewis6991/gitsigns.nvim)
- [vim-illuminate] (https://github.com/RRethy/vim-illuminate)
- [impatient.nvim] (https://github.com/lewis6991/impatient.nvim)
- [mason.nvim] (https://github.com/williamboman/mason.nvim)
- [null-ls.nvim] (https://github.com/jose-elias-alvarez/null-ls.nvim)
- [lspsaga.nvim] (https://github.com/glepnir/lspsaga.nvim)
- [lualine.nvim] (https://github.com/nvim-lualine/lualine.nvim)
- [LuaSnip] (https://github.com/L3MON4D3/LuaSnip)
- [vim-matchtag] (https://github.com/leafOfTree/vim-matchtag)
- [nvim-tree.lua] (https://github.com/nvim-tree/nvim-tree.lua)
- [project.nvim] (https://github.com/ahmedkhalf/project.nvim)
- [telescope.nvim] (https://github.com/nvim-telescope/telescope.nvim)
- [todo-comment.nvim] (https://github.com/folke/todo-comments.nvim)
- [toggleterm.nvim] (https://github.com/akinsho/toggleterm.nvim)
- [nvim-treesitter] (https://github.com/nvim-treesitter/nvim-treesitter)
- [trouble.nvim] (https://github.com/folke/trouble.nvim)
- [which-key.nvim] (https://github.com/folke/which-key.nvim)
- and other required dependencies plugins for these...

## KeyBindings
Most of the keybindings are set up with the `<leader>` i.e. `<space>` key prefix so that which-key plugin can help us to find the desired key shortcuts. The benefit is beginner do not need to remember key shortcuts. When, you are in normal mode, pressing `<space>` once will open up a which-key menu. And pressing `<space>w` will show the some builtin shortcuts that are available in normal mode.

By adding `<space>` prefix, we are increasing the keys to be pressed to trigger the events. So, you can set the keymaps according to your comfort. 

All the configured custom keymap are listed below (Note: Builtin shortcuts of vim and neovim are not included here):-

- `<Ctrl-h>` - Move focus to the left window of current window 
- `<Ctrl-j>` - Move focus to the below window of current
- `<Ctrl-k>` - Move focus to the top window of current
- `<Ctrl-l>` - Move focus to the right window of current

- `<Ctrl-up>` - Resize current window by decreasing its top value 
- `<Ctrl-down>` - Resize current window by increasing its bottom value
- `<Ctrl-left>` - Resize current window by decreasing itsleft value
- `<Ctrl-right>` - Resize current window by increasing its right value

- `<Shift-l>` - Navigate to the next buffer of current buffer 
- `<Shift-h>` - Navigate to previous buffer of current buffer

- `<Ctrl-c>` - Copy whole file content to clipboard
- `p` - Paste in visual mode

- `ij` - Enter normal mode from insert and visual mode 

- `<` - Indent left in visual mode
- `>` - Indent right in visual mode

- `<Alt-j>` - Move current line down in normal, insert and visual mode.
- `<Alt-k>` - Move current line up in normal, insert and visual mode.

- `<Space>u` - Write the current buffer to disk if there is any change to the file i.e. save the file.
- `<Space>q` - Write the current buffer to disk and close it.

- Tricky one, for fastwrap provided by nvim-autopairs
```
| Before      | Input                | After       |
| ----------- | -------------------- | ----------- |
| (|foobar    | <Alt-e> then press a | (|foobar)   |
| (|)(foobar) | <Alt-e> then press q | (|(foobar)) |
```
- 

