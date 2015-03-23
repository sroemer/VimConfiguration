if exists("b:current_syntax")
    finish
endif

hi VipacLogFatal     guibg=red guifg=fg
hi VipacLogError     guibg=bg  guifg=red
hi VipacLogWarning   guibg=bg  guifg=yellow
hi VipacLogConfig    guibg=bg  guifg=grey
hi VipacLogEvent     guibg=bg  guifg=fg
hi VipacLogInfo      guibg=bg  guifg=fg
hi VipacLogDebug     guibg=bg  guifg=grey
hi VipacLogFineDebug guibg=bg  guifg=grey
hi VipacLogProfile   guibg=bg  guifg=grey

syn match VipacLogFatal     /^.\{36\}FATAL.*$/
syn match VipacLogError     /^.\{36\}ERROR.*$/
syn match VipacLogWarning   /^.\{36\}WARN .*$/
syn match VipacLogConfig    /^.\{36\}CONF .*$/
syn match VipacLogEvent     /^.\{36\}EVENT.*$/
syn match VipacLogInfo      /^.\{36\}INFO .*$/
syn match VipacLogDebug     /^.\{36\}DEBUG.*$/
syn match VipacLogFineDebug /^.\{36\}FINE .*$/
syn match VipacLogProfile   /^.\{36\}PROF .*$/
