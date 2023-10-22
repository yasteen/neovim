"
" NOTE-TAKING SYNTAX HIGHLIGHTING
"

" Title
syn region noteTitle start='---' end='---' oneline

" Subtitle
syn match noteSubtitle '^.*\~$'

" Before colon
syn match noteColon '^.*:'

" Code block
syn region noteCode start='```' end='```'

" Bullet point
syn match noteBullet '^ *- '

" Emphasis (Highlight)
syn region noteBold start='\*\*' end='\*\*' oneline

let b:current_syntax = "note"

hi def link noteTitle       Underlined
hi def link noteCode        Comment
hi def link noteBullet      Constant
hi def link noteSubtitle    Special
hi def link noteColon       Type
hi noteBold gui=italic
hi noteBold cterm=italic
" hi def link noteBold        Special
