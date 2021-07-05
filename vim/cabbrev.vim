" Git
"cabbrev gs Git status
"cabbrev gba Git branch -a
"cabbrev gcof Git checkout -f
"cabbrev gd Git diff
"cabbrev gco Git checkout
"cabbrev grh Git reset --hard
"cabbrev ga Git add
"cabbrev gcm Git commit -m ""<Left><C-R>=Eatchar('\s')<cr>
"cabbrev gb Git branch
"cabbrev gbc Git checkout -b
"cabbrev gpu Git push origin master
"cabbrev gpoh Git push origin HEAD
"cabbrev gpd Git pull origin master
"cabbrev gl Git log --pretty --pretty=oneline
"cabbrev gcma Git add .<cr>:Git commit -m ""<Left><C-R>=Eatchar('\s')<cr>
"cabbrev gam Git commit --amend
"cabbrev gamend Git commit --amend

" Reload snippets
cabbrev rs call neosnippet#variables#set_snippets({})<cr>

" Reload vim
cabbrev rv source $MYVIMRC<cr>

" Reload vim abbreviations
cabbrev ra source ~/.vim-dictionary/abbreviations.vim<cr>

" quickly set file type, python, bash, shell
"cabbrev setftpy set ft=python
"cabbrev setftpython set ft=python
"cabbrev setftsh set ft=sh
"cabbrev setftbash set ft=sh

" Aliases for jumping around quickly
cabbrev cdh cd $HOME<cr>
cabbrev cdg cd $HOME/git<cr>
cabbrev cdd cd $HOME/.dotfiles<cr>
" cd to codebreakers dir
"cabbrev cdcb cd $HOME/git/cb<cr>

" set conceallevel=0
"cabbrev nc set conceallevel=0

" Supposed to be Change dir, this might go away since it might be faster to
" just open the file...
"cabbrev Cd :call fzf#run({'source':  'find . \( -name ".git" -o -name ".vim" -o -name "Library" \) -prune  -o -type d -print','sink': 'cd'})

" Hugo make public
"cabbrev mp :!make public<cr><cr>
