if did_filetype()   " filetype already set..
    finish          " ..don't do these checks
endif

function DetectVipacLogFile()
    if getline(1) =~ "^[0-9]\\{8\\}|[0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\}\\.[0-9]\\{3\\}|[0-9A-F]\\{4\\}|[0-9A-F]\\{8\\}|.\\{5\\}|"
        setfiletype vipaclog
    endif
endfunction

au BufRead,BufNewFile *.log     call DetectVipacLogFile()
au BufRead,BufNewFile *.log.*   call DetectVipacLogFile()
