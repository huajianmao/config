let g:ctrlp_map = '<C-p>'
let g:ctrlp_max_files = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz,*/node_modules/*,*.tgz,*.gz,*.bz2,*.tar.bz2,*.tar,*.7z,*.deb,*.class,*.jar,*/workspace/spark/*target/*,*/.git/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|target|dist)|(\.(git|hg|svn|DS_Store))$',
  \ 'file': '\v\.(exe|so|dll|swp|DS_Store)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|hg|svn|DS_Store))$'


