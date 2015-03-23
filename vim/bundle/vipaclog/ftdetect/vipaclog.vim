if did_filetype()   " filetype already set..
    finish          " ..don't do these checks
endif
function DetectVipacLogFile()
    if getline(1) =~ '^\d\{8\}\|\d\{2\}:\d\{2\}:\d\{2\}\.\d\{3\}\|[0-9A-F]\{4\}\|[0-9A-F]\{8\}\|'
        setfiletype vipaclog
    endif
endfunction
au BufRead,BufNewFile *.log     call DetectVipacLogFile()
