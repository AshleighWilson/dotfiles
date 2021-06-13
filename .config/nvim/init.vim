call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'stevearc/vim-arduino'
call plug#end()

set number " Show line numbers
set autoread " Re-read files modified outside nvim

" Reload nvim configuration
nnoremap <leader>rc :source $MYVIMRC<CR>

" Open/close NERDTree
map <C-o> :NERDTreeToggle<CR>

" Arduino key mappings
nnoremap <buffer> <leader>ac :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>as :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
