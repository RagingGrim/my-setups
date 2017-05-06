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

" ------------------------------------
" THIS IS WHERE YOUR PLUGINS WILL COME
" ------------------------------------

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'zchee/deoplete-clang'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'junegunn/fzf'
NeoBundle 'neomake/neomake'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'artur-shaik/vim-javacomplete2'

call neobundle#end()  
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------

" Custom Settings-----
set number
set relativenumber
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:airline_theme='base16'
let g:colorcolumn=80

set foldmethod=indent

" Custom Keybindings----
nnoremap <F4> :NERDTreeToggle<CR> 

" Colors----
let base16colorspace=256
colorscheme base16-ashes

" Custom Functions
"" Toggle fold state between closed and opened.
"" If there is no fold at current line, just moves forward.
"" If it is present, reverse it's state.
fun! ToggleFold()
    if foldlevel('.') == 0
        normal! l
    else
        if foldclosed('.') < 0
            . foldclose
        else
            . foldopen
        endif
    endif
    " Clear status line
    echo
endfun



" Map this function to Space key.
noremap f :call ToggleFold()<CR>

" Styling
match ErrorMsg '\%>80v.\+'

" autocmd
autocmd! BufWritePost * Neomake
