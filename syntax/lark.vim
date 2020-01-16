" Vim syntax file
" Language: Lark (EBNF)
" Maintainer: J Isaac Stone
" Latest Revision: 17 Jan 2020

if exists("b:current_syntax")
  finish
endif

syn match larkRule "[a-z_]\+"
syn match larkTerm "[A-Z_]\+"
syn match larkRuleMod "[!?]" contained
syn match larkRegexMod "[imulx]\{1,5\}" contained
syn match larkStringMod "i" contained
syn match colon ":" contained
syn match larkPriority "\.\d\+"hs=s+1 contained
syn region larkRegex start="/" skip="\\." end="/" nextgroup=larkRegexMod
syn region larkString start=/"/ skip=/\\./ end=/"/ nextgroup=larkStringMod
syn match larkDirective "^\s*%\(ignore\|import\|declare\)"
syn match ruleOrTerm "^\s*[!?]\=\(\w\|\.\)\+:" contains=larkRule,larkTerm,larkRuleMod,larkPriority,colon
syn region larkComment start="//" end="$"

let b:current_syntax = "lark"

hi def link larkComment Comment
hi def link larkRule Identifier
hi def link larkTerm Identifier
hi def link larkRegex Type
hi def link larkString Type
hi def link colon Delimiter
hi def link larkPriority Statement
hi def link larkRuleMod Statement
hi def link larkRegexMod Statement
hi def link larkStringMod Statement
hi def link larkDirective PreProc
