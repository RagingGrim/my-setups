" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'

" Nerdtree
NeoBundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

" Icons
NeoBundle 'ryanoasis/vim-devicons'
set encoding=utf-8

" Deoplete
NeoBundle 'Shougo/deoplete.nvim'
inoremap <expr><C-a> deoplete#smart_close_popup()."\<C-a>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Rust
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'sebastianmarkow/deoplete-rust'
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/src/rust/src'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1 

" ctrlp
NeoBundle 'kien/ctrlp.vim'

" vim-airline + themes
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-airline/vim-airline'
"let g:airline_theme='dark'
let g:guifont='Inconsolata'
let g:airline_powerline_fonts = 1

" syntastic
NeoBundle 'vim-syntastic/syntastic'


" base 16
NeoBundle 'chriskempson/base16-vim'
let base16colorspace=256

call neobundle#end()  
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------


" General Vim Settings
set relativenumber
set number
colorscheme base16-tomorrow-night
