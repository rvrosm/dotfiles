" comment
hi clear

runtime colors/retrobox.vim
if &background ==# 'dark'

  hi Normal guifg=#E0D1AB guibg=#111111

  " this is the main color
  " hi link goFuntionCall FunctionCall
  " hi link goBuiltins FunctionCall
  " hi! def link goFuntionCall NONE
  " hi! def link goBuiltins NONE
  " hi! def link goFuntionCall FunctionCall
  " hi! def link goBuiltins FunctionCall
  " hi FunctionCall guifg=#FABD2F
  hi goFunctionCall guifg=#FABD2F
  hi pythonFunctionCall  guifg=#FABD2F     
  hi Title guifg=#FABD2F     

  " Function color is Analogous color of FunctionCall
	hi Function guifg=#FA812F


  " Type color is Complementary color of FunctionCall
	hi Type guifg=#566FA5
	hi Structure guifg=#566FA5
	" Identifier color is Shades color of Type
	hi Identifier guifg=#6E8ED4

  " Operator color is like Square color of FunctionCall
	hi Operator guifg=#2FA938
	" hi link goBuiltins Operator

	" goBuiltins color is Analogous color of Keyword color
  hi goBuiltins guifg=#FA6B34
  hi pythonBuiltinFunc guifg=#FA6B34     

	hi String guifg=#6BB36B

  " hi Comment guifg=#AAAAAA
  hi Comment guifg=#ADD9AD
  hi Folded guifg=#AAAAAA

  " Error
  hi Error gui=reverse guifg=#800000 guibg=#eeeeee 
  hi ErrorMsg guifg=#eeeeee guibg=#800000 
  hi Todo gui=bold guifg=bg guibg=yellow

	" Search color is Shades color of IncSearch
	hi IncSearch gui=reverse guibg=fg guifg='#005c00' 
	hi Search gui=bold,reverse guibg=fg guifg='#008000' 

else
  hi Comment guifg=#111111
  hi Folded guifg=#111111

 " this is the main color
  " hi link goFuntionCall FunctionCall
  " hi link goBuiltins FunctionCall
  " hi FunctionCall guifg=#FABD2F
  " hi goFunctionCall guifg=#FABD2F
  " hi goBuiltins guifg=#FABD2F


  " Function color is Analogous color of FunctionCall
	" hi Function guifg=#FA812F

  " Type color is Complementary color of FunctionCall
	" hi Type guifg=#566FA5

  " Operator color is like Square color of FunctionCall
	" hi Operator guifg=#2FA938

	" hi String guifg=#6BB36B

  " hi Comment guifg=#AAAAAA
  " hi Folded guifg=#AAAAAA

  " Conventional
  " hi Error guifg=#800000 guibg=#ffffff gui=reverse 
  " hi ErrorMsg guifg=#FFFFFF guibg=#800000 gui=NONE 

endif

"  '#000000',  " Black
"  '#fe0100',  " Red
"  '#33ff00',  " Green
"  '#feff00',  " Yellow
"  '#0066ff',  " Blue
"  '#cc00ff',  " Magenta
"  '#00ffff',  " Cyan
"  '#dcdcdc',  " White
"  '#808080',  " Bright Black (Grey)
"  '#fe0100',  " Bright Red
"  '#33ff00',  " Bright Green
"  '#feff00',  " Bright Yellow
"  '#0066ff',  " Bright Blue
"  '#cc00ff',  " Bright Magenta
"  '#00ffff',  " Bright Cyan
"  '#ffffff'   " Bright White

let g:terminal_ansi_colors = [
  \ '#000000',  
  \ '#fe0100',  
  \ '#33ff00',  
  \ '#feff00',  
  \ '#0066ff',  
  \ '#cc00ff',  
  \ '#00ffff',  
  \ '#dcdcdc',  
  \ '#808080',  
  \ '#fe0100',  
  \ '#33ff00',  
  \ '#feff00',  
  \ '#0066ff',  
  \ '#cc00ff',  
  \ '#00ffff',  
  \ '#ffffff'   
  \ ]

let g:colors_name = 'gogogo'
