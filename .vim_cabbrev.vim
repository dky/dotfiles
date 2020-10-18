" Short for "Close all buffers" - Closes all open buffers except current.
cabbrev cab call CloseAllBuffersButCurrent()<cr>
" reload vim quickly
cabbrev rv source $MYVIMRC<cr>
" re-source vim abbreviations
cabbrev ra source ~/.vim/dict/abbreviations.vim<cr>
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

cabbrev rs call neosnippet#variables#set_snippets({})<cr>
" quickly set file type, python, bash, shell
cabbrev setftpy set ft=python
cabbrev setftpython set ft=python
cabbrev setftsh set ft=sh
cabbrev setftbash set ft=sh
" Aliases for jumping around quickly
cabbrev cdh cd $HOME<cr>
cabbrev cdg cd $HOME/git<cr>
cabbrev cdd cd $HOME/.dotfiles<cr>
" Create a directory with current date
cabbrev cdcb cd $HOME/git/cb<cr>

cabbrev Cd :call fzf#run({'source':  'find . \( -name ".git" -o -name ".vim" -o -name "Library" \) -prune  -o -type d -print','sink': 'cd'})
" Hugo make public
cabbrev mp :!make public<cr><cr>
"Allow us to toggle indentlines on off
cabbrev tn Tnew<cr>
cabbrev t T

" floatterm
cabbrev fts FloatermShow<cr>
cabbrev ft FloatermNew<cr>
cabbrev ftt FloatermToggle<cr>
cabbrev ftp FloatermPrev<cr>
cabbrev ftn FloatermNext<cr>
cabbrev ftk FloatermKill<cr>

"cabbrev goi GoImport
"cabbrev god GoDrop
"cabbrev gof GoFmt
"cabbrev got GoTest
"
"cabbrev oc Codi
"cabbrev ec Codi!
" goyo
"cabbrev gy Goyo
"cabbrev cp call CopyCurrentFile()<cr>
"cabbrev luw MacDictQuery<cr>
"cabbrev lu MacDictQuery<cr>

"cabbrev gc LanguageToolCheck<cr>
"cabbrev gq LanguageToolClear<cr>
" Wordy
"cabbrev ww Wordy weak
"cabbrev wp Wordy problematic
"cabbrev wr Wordy redundant
"cabbrev wadj Wordy adjectives
"cabbrev wadv Wordy adverbs
"cabbrev nw NoWordy
"cabbrev it IndentGuidesToggle
"
" cabbrev, see cabbrev gma as an example
" Disable relative numbers
"cabbrev norel set relativenumber!
"cabbrev bi PlugInstall<cr>
