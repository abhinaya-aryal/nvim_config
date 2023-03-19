vim.g.mapleader = " "
vim.g.maplocalleader = " "

--disable netrw file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.backup = false -- don't create a backup file
opt.background = "dark"
opt.cmdheight = 1 -- more spaces in the neovim command line for displaying messages
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = { "menu", "menuone", "preview", "noselect" }
opt.conceallevel = 0 -- Hide * markup for bold and italic
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fileencoding = "utf-8"
opt.fillchars.eob = " " --show empty lines at the end of a buffer as space default ~
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hidden = true
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" --preview incremental substitute
opt.iskeyword:append("-") --treats word with - as single word
opt.laststatus = 3
opt.list = true -- show some invisible characters (tabs...
opt.listchars:append("space: ")
opt.mouse = "nv" -- enable mouse mode "a" for all modes
opt.number = true -- print line number
opt.numberwidth = 4
opt.pumblend = 15 -- popup blend
opt.pumheight = 15 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.ruler = false
opt.scrolloff = 6 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- round indent
opt.shiftwidth = 2 -- size of an indent
-- opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Don't show mode since we have a statusline
opt.showtabline = 1
opt.showcmd = false
opt.sidescrolloff = 6 -- columns of context
opt.signcolumn = "yes" -- always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true --Don't ignore case with capitals
opt.smartindent = true -- insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- put new windows below current
opt.splitright = true -- put new windows right of current
opt.swapfile = false
opt.tabstop = 2 -- number of spaces tabs count for
opt.termguicolors = true -- true color support
opt.timeoutlen = 1000
opt.undofile = true
opt.undolevels = 500
opt.updatetime = 300 -- save swap file and trigger cursorHold
opt.wildmode = "longest:full,full" -- command-line completion mode
opt.winminwidth = 8 -- minimum window width
opt.wrap = true -- disable line wrap
opt.writebackup = false

if vim.fn.has("nvim-0.9.0") == 1 then
	opt.splitkeep = "screen"
	opt.shortmess:append({ c = true })
end

vim.g.markdown_recommended_style = 0 -- fix markdown indentation settings

vim.cmd([[
filetype plugin indent on
syntax on 
]])
