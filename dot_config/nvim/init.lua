-- Neovim Configuration
-- A modern, minimal configuration

-- Basic Settings
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Show relative line numbers
vim.opt.tabstop = 4                -- Tab width
vim.opt.shiftwidth = 4             -- Indent width
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.smartindent = true         -- Smart indentation
vim.opt.wrap = false               -- Don't wrap lines
vim.opt.swapfile = false           -- No swap files
vim.opt.backup = false             -- No backup files
vim.opt.undofile = true            -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")

-- Search Settings
vim.opt.hlsearch = false           -- Don't highlight search results
vim.opt.incsearch = true           -- Incremental search
vim.opt.ignorecase = true          -- Case insensitive search
vim.opt.smartcase = true           -- Smart case search

-- UI Settings
vim.opt.termguicolors = true       -- True color support
vim.opt.scrolloff = 8              -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8          -- Keep 8 columns left/right of cursor
vim.opt.signcolumn = "yes"         -- Always show sign column
vim.opt.cursorline = true          -- Highlight current line
vim.opt.colorcolumn = "80"         -- Show column at 80 characters

-- Split Settings
vim.opt.splitbelow = true          -- Split below
vim.opt.splitright = true          -- Split right

-- Performance
vim.opt.updatetime = 50            -- Faster completion
vim.opt.timeoutlen = 300           -- Faster key sequence completion

-- Mouse
vim.opt.mouse = "a"                -- Enable mouse support

-- Clipboard
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Key Mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clear search highlighting
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Quick save and quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":qa!<CR>", opts)

-- Terminal
keymap("n", "<leader>t", ":terminal<CR>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- File explorer (netrw)
keymap("n", "<leader>e", ":Explore<CR>", opts)

-- Auto Commands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

-- Remove trailing whitespace on save
augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
    group = "TrimWhitespace",
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- Create undo directory if it doesn't exist
vim.fn.mkdir(vim.fn.expand("~/.local/state/nvim/undo"), "p")

-- Netrw (file explorer) settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 20

-- Set colorscheme (use default if not available)
vim.cmd([[
    try
        colorscheme habamax
    catch
        colorscheme default
    endtry
]])