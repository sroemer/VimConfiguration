" make log files readonly and not modifiable
setlocal readonly
setlocal nomodifiable

" key mappings for vipac log files
nmap <F9>    :vimgrep /\CFATAL\\|ERROR\\|WARN/ %:p:h/*.log<CR>
nmap <S-F9>  :vimgrep /\C/ %:p:h/*.log
nmap <C-F9>  :%s/TRIGGERED//n
nmap <F10>   :copen<CR>
nmap <S-F10> :cclose<CR>
nmap <F11>   :cnext<CR>
