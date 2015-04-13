if exists("b:current_syntax")
    finish
endif

hi VipacLogFatal     guibg=Red guifg=fg
hi VipacLogError     guibg=bg  guifg=Red
hi VipacLogWarning   guibg=bg  guifg=DarkYellow
hi VipacLogConfig    guibg=bg  guifg=Green
hi VipacLogEvent     guibg=bg  guifg=LightBlue
hi VipacLogInfo      guibg=bg  guifg=fg
hi VipacLogDebug     guibg=bg  guifg=Gray
hi VipacLogFineDebug guibg=bg  guifg=DarkGray
hi VipacLogProfile   guibg=bg  guifg=DarkGray

syn match VipacLogFatal     /^.\{36\}FATAL.*$/
syn match VipacLogError     /^.\{36\}ERROR.*$/
syn match VipacLogWarning   /^.\{36\}WARN .*$/
syn match VipacLogConfig    /^.\{36\}CONF .*$/
syn match VipacLogEvent     /^.\{36\}EVENT.*$/
syn match VipacLogInfo      /^.\{36\}INFO .*$/
syn match VipacLogDebug     /^.\{36\}DEBUG.*$/
syn match VipacLogFineDebug /^.\{36\}FINE .*$/
syn match VipacLogProfile   /^.\{36\}PROF .*$/
