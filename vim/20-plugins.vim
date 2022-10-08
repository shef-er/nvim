""---------------------------------------
"" Plugins
""---------------------------------------

let s:plug_dir = '~/.local/share/nvim/plugged'

"" Plug automatic installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin(s:plug_dir)
  "" Close buffer saving layout
  Plug 'qpkorr/vim-bufkill'
  "" File browser
  Plug 'preservim/nerdtree'
  "" Code commenting
  Plug 'preservim/nerdcommenter'
  "" Reusable lua functions
  Plug 'nvim-lua/plenary.nvim'
  "" Git decorations
  Plug 'lewis6991/gitsigns.nvim'
call plug#end()


"" Plug: nerdtree
nnoremap <Leader>f :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeShowBookmarks = 0

let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '⊞'
let g:NERDTreeDirArrowCollapsible = '⊟'

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeBookmarksFile= '~/.local/share/nvim/NERDTreeBookmarks'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter *
      \ if argc() == 1
      \ && isdirectory(argv()[0])
      \ && !exists("s:std_in")
      \ | exe 'NERDTree' argv()[0]
      \ | wincmd p | ene | endif


"" Plug: gitsigns.nvim
lua <<EOF
require('gitsigns').setup({
  signs = {
    add = {
      hl = 'GitSignsAdd', 
      text = '│', 
      numhl='GitSignsAddNr', 
      linehl='GitSignsAddLn'
    },
    change = {
      hl = 'GitSignsChange', 
      text = '│', 
      numhl='GitSignsChangeNr', 
      linehl='GitSignsChangeLn'
    },
    delete = {
      hl = 'GitSignsDelete', 
      text = '_', 
      numhl='GitSignsDeleteNr', 
      linehl='GitSignsDeleteLn'
    },
    topdelete = {
      hl = 'GitSignsDelete', 
      text = '‾', 
      numhl='GitSignsDeleteNr', 
      linehl='GitSignsDeleteLn'
    },
    changedelete = {
      hl = 'GitSignsChange', 
      text = '~', 
      numhl='GitSignsChangeNr', 
      linehl='GitSignsChangeLn'
    },
  },
})
EOF

