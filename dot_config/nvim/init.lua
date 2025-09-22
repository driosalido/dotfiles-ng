-- Neovim Configuration
-- A modern, minimal configuration

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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
vim.opt.timeoutlen = 1000          -- Give more time for key sequences
vim.opt.ttimeoutlen = 50           -- Fast escape sequences

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

-- Plugin Configuration
require("lazy").setup({
  -- Markdown Preview Plugin (Browser)
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      -- Plugin settings
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ''
      vim.g.mkdp_browser = ''
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ''
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = 'middle',
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0
      }
      vim.g.mkdp_markdown_css = ''
      vim.g.mkdp_highlight_css = ''
      vim.g.mkdp_port = ''
      vim.g.mkdp_page_title = '「${name}」'
      vim.g.mkdp_filetypes = {'markdown'}
    end,
  },

  -- Inline Markdown Rendering Plugin
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ft = { "markdown" },
    config = function()
      require('render-markdown').setup({
        -- Configure how different headings are rendered
        headings = {
          -- Turn on / off heading icon & background rendering
          enabled = true,
          -- Turn on / off any sign column related rendering
          sign = true,
          -- Replaces '#+' of headings
          icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
          -- Added to the sign column if enabled
          signs = { '󰫎 ' },
          -- Width of the heading background:
          --  block: width of the heading text
          --  full: full width of the window
          width = 'full',
          -- The 'level' is used to index into the array using a cycle
          backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
          },
          -- The 'level' is used to index into the array using a cycle
          foregrounds = {
            'RenderMarkdownH1',
            'RenderMarkdownH2',
            'RenderMarkdownH3',
            'RenderMarkdownH4',
            'RenderMarkdownH5',
            'RenderMarkdownH6',
          },
        },
        -- Configure how code blocks are rendered
        code = {
          -- Turn on / off code block & inline code rendering
          enabled = true,
          -- Turn on / off any sign column related rendering
          sign = true,
          -- Determines how code blocks & inline code are rendered:
          --  none: disables all rendering
          --  normal: adds highlight group to code blocks & inline code
          --  language: adds language icon to sign column if enabled and icon + name above code blocks
          --  full: normal + language
          style = 'full',
          -- Amount of padding to add to the left of code blocks
          left_pad = 2,
          -- Amount of padding to add to the right of code blocks when width is 'block'
          right_pad = 2,
          -- Width of the code block background:
          --  block: width of the code block
          --  full: full width of the window
          width = 'full',
          -- Determins how the top / bottom of code block are rendered:
          --  thick: use the same highlight as the code body
          --  thin: when lines are empty overlay the above & below icons
          border = 'thin',
          -- Used above code blocks for thin border
          above = '▄',
          -- Used below code blocks for thin border
          below = '▀',
          -- Highlight for code blocks & inline code
          highlight = 'RenderMarkdownCode',
        },
        -- Configure how bullet points are rendered
        bullet = {
          -- Turn on / off list bullet rendering
          enabled = true,
          -- Replaces '-'|'+'|'*' of 'list_item'
          icons = { '●', '○', '◆', '◇' },
          -- Highlight for the bullet icon
          highlight = 'RenderMarkdownBullet',
        },
      })
    end,
  },
})

-- Additional markdown-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nc"
  end,
})

-- Markdown Preview Key mappings (global)
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ms", ":MarkdownPreview<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>mx", ":MarkdownPreviewStop<CR>", { noremap = true, silent = true })

-- Inline Markdown Rendering Key mappings
vim.keymap.set("n", "<leader>mr", ":RenderMarkdown toggle<CR>", { noremap = true, silent = true })