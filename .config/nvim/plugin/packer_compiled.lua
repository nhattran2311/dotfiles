-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hori2311/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hori2311/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hori2311/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hori2311/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hori2311/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nÍ\3\0\0\t\0\26\0;6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0006\5\0\0009\5\14\0059\5\15\5'\a\16\0005\b\17\0B\5\3\2&\4\5\4B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\18\0'\4\19\0005\5\20\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\24\0'\4\22\0005\5\25\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\14<leader>,\1\0\1\vsilent\2\18:Buffers!<cr>\15<leader>bb\1\0\1\vsilent\2\r:Rg!<cr>\14<leader>/\1\0\1\vsilent\2\n%:p:h\vexpand\afn\r:Files! \15<leader>fo\1\0\1\vsilent\2\17:Files!<cr>'\15<leader>ff\1\0\1\vsilent\2\18:GFiles!<cr>'\21<leader><leader>\6n\bset\vkeymap\21fzf_buffers_jump\6g\bvim\0" },
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\ná\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\28show_first_indent_level\1\tchar\b‚ñè#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n•\6\0\0\t\0&\0=6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\n\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0054\6\0\0=\6\t\5=\5\v\0045\5\r\0005\6\f\0=\6\14\0055\6\15\0=\6\16\0054\6\3\0005\a\17\0>\a\1\6=\6\18\0055\6\24\0005\a\19\0005\b\20\0=\b\21\a5\b\22\0=\b\23\a>\a\1\6=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\5=\5\30\0045\5\31\0004\6\0\0=\6\14\0054\6\0\0=\6\16\0054\6\3\0005\a \0>\a\1\6=\6\18\0055\6!\0=\6\25\0054\6\0\0=\6\27\0054\6\0\0=\6\29\5=\5\"\0044\5\0\0=\5#\0045\5$\0=\5%\4B\2\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\2\0\rfilename\16file_status\2\tpath\3\1\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\0\rencoding\rfiletype\fsymbols\1\0\4\thint\tÔÉ´ \tinfo\tÔëâ \nerror\tÔÜà \twarn\tÔÅ± \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\14lualine_c\1\2\2\0\rfilename\16file_status\2\tpath\3\0\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\1\0\3\17globalstatus\2\ntheme\tauto\18icons_enabled\2\nsetup\flualine\frequire\npcall\0" },
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\nˆ\1\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\27:Neogit kind=split<cr>\15<leader>gs\6n\bset\vkeymap\bvim\17integrations\1\0\1\rdiffview\2\1\0\2!disable_context_highlighting\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    keys = { { "", "<leader>g" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nvim-transparent"] = {
    config = { "\27LJ\2\n√\2\0\0\4\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0024\3\0\0=\3\a\2B\0\2\1K\0\1\0\19exclude_groups\17extra_groups\vgroups\1\0\0\1\23\0\0\vNormal\rNormalNC\fComment\rConstant\fSpecial\15Identifier\14Statement\fPreProc\tType\15Underlined\tTodo\vString\rFunction\16Conditional\vRepeat\rOperator\14Structure\vLineNr\fNonText\15SignColumn\17CursorLineNr\16EndOfBuffer\nsetup\16transparent\frequire\0" },
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n±\3\0\0\a\0\19\0\0316\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\6\0005\5\4\0004\6\0\0=\6\5\5=\5\a\0045\5\b\0004\6\0\0=\6\5\5=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4B\2\2\0016\2\1\0'\4\14\0B\2\2\0029\2\15\2B\2\1\0029\3\16\0025\4\18\0=\4\17\3K\0\1\0\1\3\0\0\15javascript\19typescript.tsx\27filetype_to_parsername\btsx\23get_parser_configs\28nvim-treesitter.parsers\fautotag\1\0\1\venable\2\21ensure_installed\1\14\0\0\bcss\thtml\tbash\15dockerfile\ago\bhcl\tjson\vpython\trust\tyaml\ttoml\tfish\blua\vindent\1\0\1\venable\2\14highlight\1\0\0\fdisable\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-commentary"] = {
    commands = { "Commentary" },
    keys = { { "n", "gc" }, { "v", "gc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hori2311/.local/share/nvim/site/pack/packer/opt/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n•\6\0\0\t\0&\0=6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\n\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0054\6\0\0=\6\t\5=\5\v\0045\5\r\0005\6\f\0=\6\14\0055\6\15\0=\6\16\0054\6\3\0005\a\17\0>\a\1\6=\6\18\0055\6\24\0005\a\19\0005\b\20\0=\b\21\a5\b\22\0=\b\23\a>\a\1\6=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\5=\5\30\0045\5\31\0004\6\0\0=\6\14\0054\6\0\0=\6\16\0054\6\3\0005\a \0>\a\1\6=\6\18\0055\6!\0=\6\25\0054\6\0\0=\6\27\0054\6\0\0=\6\29\5=\5\"\0044\5\0\0=\5#\0045\5$\0=\5%\4B\2\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\2\0\rfilename\16file_status\2\tpath\3\1\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\0\rencoding\rfiletype\fsymbols\1\0\4\thint\tÔÉ´ \tinfo\tÔëâ \nerror\tÔÜà \twarn\tÔÅ± \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\14lualine_c\1\2\2\0\rfilename\16file_status\2\tpath\3\0\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\1\0\3\17globalstatus\2\ntheme\tauto\18icons_enabled\2\nsetup\flualine\frequire\npcall\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n±\3\0\0\a\0\19\0\0316\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\6\0005\5\4\0004\6\0\0=\6\5\5=\5\a\0045\5\b\0004\6\0\0=\6\5\5=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4B\2\2\0016\2\1\0'\4\14\0B\2\2\0029\2\15\2B\2\1\0029\3\16\0025\4\18\0=\4\17\3K\0\1\0\1\3\0\0\15javascript\19typescript.tsx\27filetype_to_parsername\btsx\23get_parser_configs\28nvim-treesitter.parsers\fautotag\1\0\1\venable\2\21ensure_installed\1\14\0\0\bcss\thtml\tbash\15dockerfile\ago\bhcl\tjson\vpython\trust\tyaml\ttoml\tfish\blua\vindent\1\0\1\venable\2\14highlight\1\0\0\fdisable\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\ná\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\28show_first_indent_level\1\tchar\b‚ñè#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\nÍ\3\0\0\t\0\26\0;6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0006\5\0\0009\5\14\0059\5\15\5'\a\16\0005\b\17\0B\5\3\2&\4\5\4B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\18\0'\4\19\0005\5\20\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\24\0'\4\22\0005\5\25\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\14<leader>,\1\0\1\vsilent\2\18:Buffers!<cr>\15<leader>bb\1\0\1\vsilent\2\r:Rg!<cr>\14<leader>/\1\0\1\vsilent\2\n%:p:h\vexpand\afn\r:Files! \15<leader>fo\1\0\1\vsilent\2\17:Files!<cr>'\15<leader>ff\1\0\1\vsilent\2\18:GFiles!<cr>'\21<leader><leader>\6n\bset\vkeymap\21fzf_buffers_jump\6g\bvim\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-transparent
time([[Config for nvim-transparent]], true)
try_loadstring("\27LJ\2\n√\2\0\0\4\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0024\3\0\0=\3\a\2B\0\2\1K\0\1\0\19exclude_groups\17extra_groups\vgroups\1\0\0\1\23\0\0\vNormal\rNormalNC\fComment\rConstant\fSpecial\15Identifier\14Statement\fPreProc\tType\15Underlined\tTodo\vString\rFunction\16Conditional\vRepeat\rOperator\14Structure\vLineNr\fNonText\15SignColumn\17CursorLineNr\16EndOfBuffer\nsetup\16transparent\frequire\0", "config", "nvim-transparent")
time([[Config for nvim-transparent]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Commentary', function(cmdargs)
          require('packer.load')({'vim-commentary'}, { cmd = 'Commentary', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-commentary'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Commentary ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neogit', function(cmdargs)
          require('packer.load')({'neogit'}, { cmd = 'Neogit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neogit'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neogit ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>g <cmd>lua require("packer.load")({'neogit'}, { keys = "<lt>leader>g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
