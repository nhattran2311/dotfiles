if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()


if has("nvim")
	" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	Plug 'junegunn/vim-easy-align'

	" Any valid git URL is allowed
	Plug 'https://github.com/junegunn/vim-github-dashboard.git'

	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	"navigate
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'itchyny/lightline.vim'

	"editor
	Plug 'easymotion/vim-easymotion'
	Plug 'tpope/vim-surround'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'preservim/nerdcommenter'
	Plug 'neoclide/coc.nvim'
	Plug 'jiangmiao/auto-pairs'

	"theme
	Plug 'dracula/vim', { 'as': 'dracula' }

	"nvim icon
	Plug 'ryanoasis/vim-devicons'

	Plug 'junegunn/goyo.vim'
	"readme preview
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

endif




" Initialize plugin system
call plug#end()
