" Short for "Close all buffers" - Closes all open buffers except current.
cabbrev cab call CloseAllBuffersButCurrent()<cr>

" Git
cabbrev gs Git status
cabbrev gd Git diff
cabbrev gco Git checkout
cabbrev grh Git reset --hard
cabbrev ga Git add
cabbrev gcm Git commit -m ""<Left><C-R>=Eatchar('\s')<cr>
cabbrev gb Git branch
cabbrev gbc Git checkout -b
cabbrev gpu Git push origin master
cabbrev gpoh Git push origin HEAD
cabbrev gpd Git pull origin master
cabbrev gl Git log --pretty --pretty=oneline
cabbrev gcma Git add .<cr>:Git commit -m ""<Left><C-R>=Eatchar('\s')<cr>
cabbrev gam Git commit --amend
cabbrev gamend Git commit --amend

" Reload snippets
cabbrev rs call neosnippet#variables#set_snippets({})<cr>

" Reload vim
cabbrev rv source $MYVIMRC<cr>

" Reload vim abbreviations
cabbrev ra source ~/.vim-dictionary/abbreviations.vim<cr>

" quickly set file type, python, bash, shell
cabbrev setftpy set ft=python
cabbrev setftpython set ft=python
cabbrev setftsh set ft=sh
cabbrev setftbash set ft=sh

" Aliases for jumping around quickly
cabbrev cdh cd $HOME<cr>
cabbrev cdg cd $HOME/git<cr>
cabbrev cdd cd $HOME/.dotfiles<cr>

" set conceallevel=0
cabbrev nc set conceallevel=0

" Create a directory with current date
cabbrev cdcb cd $HOME/git/cb<cr>

cabbrev Cd :call fzf#run({'source':  'find . \( -name ".git" -o -name ".vim" -o -name "Library" \) -prune  -o -type d -print','sink': 'cd'})

" Hugo make public
cabbrev mp :!make public<cr><cr>

" Neoterm
cabbrev tn Tnew<cr>
cabbrev tc Tclose<cr>
"Need to come up with new mapping for this, this breaks typing the word "to"
"cabbrev to Topen<cr>
cabbrev t T

" floatterm
cabbrev fts FloatermShow<cr>
cabbrev ft FloatermNew<cr>
cabbrev ftt FloatermToggle<cr>
cabbrev ftp FloatermPrev<cr>
cabbrev ftn FloatermNext<cr>
cabbrev ftk FloatermKill<cr>

" Golang
"cabbrev goi GoImport
"cabbrev god GoDrop
"cabbrev gof GoFmt
"cabbrev got GoTest

" Codi
cabbrev oc Codi
cabbrev ec Codi!
