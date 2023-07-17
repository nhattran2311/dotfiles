local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local has = function(x)
  return vim.fn.has(x) == 1
end

local executable = function(x)
  return vim.fn.executable(x) == 1
end

local is_wsl = (function()
  local output = vim.fn.systemlist "uname -r"
  return not not string.find(output[1] or "", "WSL")
end)()

local is_mac = has "macunix"
local is_linux = not is_wsl and not is_mac

local max_jobs = nil
if is_mac then
  max_jobs = 32
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Status line
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      local status, lualine = pcall(require, "lualine")
      if (not status) then return end
      lualine.setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          globalstatus = true,
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {}
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
          } },
          lualine_x = {
            { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
              hint = ' ' } },
            'encoding',
            'filetype'
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
          } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = { 'fugitive' }
      }
    end,
  })

  -- Theme
  use({
   "folke/tokyonight.nvim",
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
    },
  })

  use({
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      "<leader>g",
    },
    cmd = {
      "Neogit",
    },
    config = function()
      require("neogit").setup({
          disable_commit_confirmation = true,
          disable_context_highlighting = true,
          integrations = {
            diffview = true,
          },
      })
      vim.keymap.set("n", "<leader>gs", ":Neogit kind=split<cr>", { silent = true })
    end,
  })

  -- Auto pair
  use({
    "jiangmiao/auto-pairs"
  })

  -- Comment
  use({
    "tpope/vim-commentary",
    keys = {
      { "n", "gc" },
      { "v", "gc" },
    },
    cmd = {
      "Commentary",
    }
  })

  -- Fuzzy search
  use({
    "junegunn/fzf.vim",
    requires = {
      "junegunn/fzf",
    },
    config = function()
      vim.g.fzf_buffers_jump = 1
      -- find file in global
      vim.keymap.set("n", "<leader><leader>", ":GFiles!<cr>'", { silent = true })
      -- find the file 
      vim.keymap.set("n", "<leader>ff", ":Files!<cr>'", { silent = true })
      -- open file
      vim.keymap.set("n", "<leader>fo", ":Files! " .. vim.fn.expand("%:p:h", { silent = true }))
      -- search global
      vim.keymap.set("n", "<leader>/", ":Rg!<cr>", { silent = true })
      vim.keymap.set("n", "<leader>bb", ":Buffers!<cr>", { silent = true })
      vim.keymap.set("n", "<leader>,", ":Buffers!<cr>", { silent = true })
    end,
  })

  -- Syntax highlighting and objects
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      local status, ts = pcall(require, "nvim-treesitter.configs")
      if (not status) then return end
      ts.setup {
        highlight = {
          enable = true,
          disable = {},
        },
        indent = {
          enable = true,
          disable = {},
        },
        ensure_installed = {
          "css",
          "html",
          "bash",
          "dockerfile",
          "go",
          "hcl",
          "json",
          "python",
          "rust",
          "yaml",
          "toml",
          "fish",
          "lua",
        },
        autotag = {
          enable = true,
        },
      }
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
    end,
  })

  -- Show indent line
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        char = "▏",
        show_first_indent_level = false,
        show_trailing_blankline_indent = false,
      })
    end,
  })

  -- Show tree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup()
    end,
  })
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}

  -- Show background
  use({
    "xiyaowong/nvim-transparent",
    config = function()
     require("transparent").setup({
       groups = { -- table: default groups
         'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
         'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
         'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
         'SignColumn', 'CursorLineNr', 'EndOfBuffer',
       },
       extra_groups = {}, -- table: additional groups that should be cleared
       exclude_groups = {}, -- table: groups you don't want to clear
     })
    end,
  })
end)
