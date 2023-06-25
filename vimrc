" TODO: Figure out something that works in the Linux non-x-windows terminal
" too.
let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" send t_SI/t_EI to correct the cursor shape (assuming we are starting in
" normal mode)
startinsert
call feedkeys("\<esc>")
