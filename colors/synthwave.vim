" -----------------------------------------------------------------------------
" File: synthwave.vim
" Description: Synthwave/Outrun color scheme for Vim
" Author: jacobshu <jacob@builtdigital.io>
" Source: https://github.com/jacobshu/synthwave
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='synthwave'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:synthwave_bold')
  let g:synthwave_bold=1
endif
if !exists('g:synthwave_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:synthwave_italic=1
  else
    let g:synthwave_italic=0
  endif
endif
if !exists('g:synthwave_undercurl')
  let g:synthwave_undercurl=1
endif
if !exists('g:synthwave_underline')
  let g:synthwave_underline=1
endif
if !exists('g:synthwave_inverse')
  let g:synthwave_inverse=1
endif

if !exists('g:synthwave_guisp_fallback') || index(['fg', 'bg'], g:synthwave_guisp_fallback) == -1
  let g:synthwave_guisp_fallback='NONE'
endif

if !exists('g:synthwave_improved_strings')
  let g:synthwave_improved_strings=0
endif

if !exists('g:synthwave_improved_warnings')
  let g:synthwave_improved_warnings=0
endif

if !exists('g:synthwave_termcolors')
  let g:synthwave_termcolors=256
endif

if !exists('g:synthwave_invert_indent_guides')
  let g:synthwave_invert_indent_guides=0
endif

if exists('g:synthwave_contrast')
  echo 'g:synthwave_contrast is deprecated; use g:synthwave_contrast_light and g:synthwave_contrast_dark instead'
endif

if !exists('g:synthwave_contrast_dark')
  let g:synthwave_contrast_dark='medium'
endif

if !exists('g:synthwave_contrast_light')
  let g:synthwave_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette Utility Functions: {{{

function! s:Color(name, default, ...)
  " color already set, validate option
  if has_key(s:gb, a:name)
    let l:color = s:gb[a:name]

    if type(l:color) == type('')
      " gui color only
      let s:gb[a:name] = copy(a:default)
      let s:gb[a:name][0] = l:color
      return 1
    elseif type(l:color) == type(0)
      " terminal color only
      let s:gb[a:name] = copy(a:default)
      let s:gb[a:name][1] = l:color
      return 1
    elseif type(l:color) == type([])
          \ && len(l:color) == 2
          \ && type(l:color[0]) == type('')
          \ && type(l:color[1]) == type(0)
      " gui and terminal color
      return 1
    else
      " invalid value
      echo a:name 'is invalid, usage: let g:synthwave_colors.color = (["#ffffff", 255]|"#ffffff"|255)'
      return 0
    endif

  endif

  " set default option
  let s:gb[a:name] = a:default
  return 1
endfunction

" }}}
" Palette: {{{

" get the global synthwave palette options, if any
let g:synthwave_colors = get(g:, 'synthwave_colors', {})
" initialize the script palette
let s:gb = copy(g:synthwave_colors)
let g:current_synthwave_colors = s:gb

" set palette default colors
call s:Color('dark0_hard',  ['#191b26', 234])
call s:Color('dark0',       ['#282a36', 235])
call s:Color('dark0_soft',  ['#383a46', 236])
call s:Color('dark1',       ['#484a57', 237])
call s:Color('dark2',       ['#595b68', 239])
call s:Color('dark3',       ['#6b6d7a', 241])
call s:Color('dark4',       ['#7d7f8c', 243])
call s:Color('dark4_256',   ['#7d7f8c', 243])

call s:Color('gray_245',    ['#90929f', 245])
call s:Color('gray_244',    ['#90929f', 244])

call s:Color('light0_hard', ['#ffffff', 230])
call s:Color('light0',      ['#f9f9ff', 229])
call s:Color('light0_soft', ['#e4e4ea', 228])
call s:Color('light1',      ['#d0d0d6', 223])
call s:Color('light2',      ['#bcbcc2', 250])
call s:Color('light3',      ['#a8a8ae', 248])
call s:Color('light4',      ['#95959b', 246])
call s:Color('light4_256',  ['#95959b', 246])

call s:Color('bright_red',     ['#ff8a7f', 167])
call s:Color('neutral_red',    ['#ff5c57', 124])
call s:Color('faded_red',      ['#cb2a31', 88])
call s:Color('bright_green',   ['#8effba', 142])
call s:Color('neutral_green',  ['#5af78e', 106])
call s:Color('faded_green',    ['#0cc864', 100])
call s:Color('bright_yellow',  ['#ffffca', 214])
call s:Color('neutral_yellow', ['#f3f99d', 172])
call s:Color('faded_yellow',   ['#c4cb72', 136])
call s:Color('bright_blue',    ['#8cf5ff', 109])
call s:Color('neutral_blue',   ['#57c7ff', 66])
call s:Color('faded_blue',     ['#009bd1', 24])
call s:Color('bright_orange',  ['#ffd892', 208])
call s:Color('neutral_orange', ['#fdab68', 166])
call s:Color('faded_orange',   ['#cc803f', 130])
call s:Color('bright_purple',  ['#ff98ef', 175])
call s:Color('neutral_purple', ['#ff6ac1', 132])
call s:Color('faded_purple',   ['#ce3a95', 96])
call s:Color('bright_aqua',    ['#c9ffff', 108])
call s:Color('neutral_aqua',   ['#9aedfe', 72])
call s:Color('faded_aqua',     ['#6cbfd0', 65])




" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:synthwave_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:synthwave_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:synthwave_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:synthwave_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:synthwave_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:synthwave_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:synthwave_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:synthwave_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:synthwave_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:synthwave_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
call s:Color('bg0', s:bg0)
call s:Color('bg1', s:bg1)
call s:Color('bg2', s:bg2)
call s:Color('bg3', s:bg3)
call s:Color('bg4', s:bg4)

call s:Color('gray', s:gray)

call s:Color('fg0', s:fg0)
call s:Color('fg1', s:fg1)
call s:Color('fg2', s:fg2)
call s:Color('fg3', s:fg3)
call s:Color('fg4', s:fg4)

call s:Color('fg4_256', s:fg4_256)

call s:Color('red',    s:red)
call s:Color('green',  s:green)
call s:Color('yellow', s:yellow)
call s:Color('blue',   s:blue)
call s:Color('purple', s:purple)
call s:Color('aqua',   s:aqua)
call s:Color('orange', s:orange)

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:gb.bg0[0]
  let g:terminal_color_8 = s:gb.gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:gb.red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:gb.green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:gb.yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:gb.blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:gb.purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:gb.aqua[0]

  let g:terminal_color_7 = s:gb.fg4[0]
  let g:terminal_color_15 = s:gb.fg1[0]
endif

" }}}
" Setup Terminal Colors For Vim with termguicolors: {{{

if exists('*term_setansicolors')
  let g:terminal_ansi_colors = repeat([0], 16)

  let g:terminal_ansi_colors[0] = s:gb.bg0[0]
  let g:terminal_ansi_colors[8] = s:gb.gray[0]

  let g:terminal_ansi_colors[1] = s:gb.neutral_red[0]
  let g:terminal_ansi_colors[9] = s:gb.red[0]

  let g:terminal_ansi_colors[2] = s:gb.neutral_green[0]
  let g:terminal_ansi_colors[10] = s:gb.green[0]

  let g:terminal_ansi_colors[3] = s:gb.neutral_yellow[0]
  let g:terminal_ansi_colors[11] = s:gb.yellow[0]

  let g:terminal_ansi_colors[4] = s:gb.neutral_blue[0]
  let g:terminal_ansi_colors[12] = s:gb.blue[0]

  let g:terminal_ansi_colors[5] = s:gb.neutral_purple[0]
  let g:terminal_ansi_colors[13] = s:gb.purple[0]

  let g:terminal_ansi_colors[6] = s:gb.neutral_aqua[0]
  let g:terminal_ansi_colors[14] = s:gb.aqua[0]

  let g:terminal_ansi_colors[7] = s:gb.fg4[0]
  let g:terminal_ansi_colors[15] = s:gb.fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:gb.orange
if exists('g:synthwave_hls_cursor')
  let s:hls_cursor = get(s:gb, g:synthwave_hls_cursor)
endif

let s:hls_highlight = s:gb.yellow
if exists('g:synthwave_hls_highlight')
  let s:hls_highlight = get(s:gb, g:synthwave_hls_highlight)
endif

let s:number_column = s:none
if exists('g:synthwave_number_column')
  let s:number_column = get(s:gb, g:synthwave_number_column)
endif

let s:sign_column = s:gb.bg1

if exists('g:synthwave_sign_column')
  let s:sign_column = get(s:gb, g:synthwave_sign_column)
endif

let s:color_column = s:gb.bg1
if exists('g:synthwave_color_column')
  let s:color_column = get(s:gb, g:synthwave_color_column)
endif

let s:vert_split = s:gb.bg0
if exists('g:synthwave_vert_split')
  let s:vert_split = get(s:gb, g:synthwave_vert_split)
endif

let s:invert_signs = ''
if exists('g:synthwave_invert_signs')
  if g:synthwave_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:synthwave_invert_selection')
  if g:synthwave_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:synthwave_invert_tabline')
  if g:synthwave_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:tabline_sel = s:gb.green
if exists('g:synthwave_tabline_sel')
  let s:tabline_sel = get(s:gb, g:synthwave_tabline_sel)
endif

let s:italicize_comments = s:italic
if exists('g:synthwave_italicize_comments')
  if g:synthwave_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:synthwave_italicize_strings')
  if g:synthwave_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:synthwave_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:synthwave_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Synthwave Hi Groups: {{{

" memoize common hi groups
call s:HL('SynthwaveFg0', s:gb.fg0)
call s:HL('SynthwaveFg1', s:gb.fg1)
call s:HL('SynthwaveFg2', s:gb.fg2)
call s:HL('SynthwaveFg3', s:gb.fg3)
call s:HL('SynthwaveFg4', s:gb.fg4)
call s:HL('SynthwaveGray', s:gb.gray)
call s:HL('SynthwaveBg0', s:gb.bg0)
call s:HL('SynthwaveBg1', s:gb.bg1)
call s:HL('SynthwaveBg2', s:gb.bg2)
call s:HL('SynthwaveBg3', s:gb.bg3)
call s:HL('SynthwaveBg4', s:gb.bg4)

call s:HL('SynthwaveRed', s:gb.red)
call s:HL('SynthwaveRedBold', s:gb.red, s:none, s:bold)
call s:HL('SynthwaveGreen', s:gb.green)
call s:HL('SynthwaveGreenBold', s:gb.green, s:none, s:bold)
call s:HL('SynthwaveYellow', s:gb.yellow)
call s:HL('SynthwaveYellowBold', s:gb.yellow, s:none, s:bold)
call s:HL('SynthwaveBlue', s:gb.blue)
call s:HL('SynthwaveBlueBold', s:gb.blue, s:none, s:bold)
call s:HL('SynthwavePurple', s:gb.purple)
call s:HL('SynthwavePurpleBold', s:gb.purple, s:none, s:bold)
call s:HL('SynthwaveAqua', s:gb.aqua)
call s:HL('SynthwaveAquaBold', s:gb.aqua, s:none, s:bold)
call s:HL('SynthwaveOrange', s:gb.orange)
call s:HL('SynthwaveOrangeBold', s:gb.orange, s:none, s:bold)

call s:HL('SynthwaveRedSign', s:gb.red, s:sign_column, s:invert_signs)
call s:HL('SynthwaveGreenSign', s:gb.green, s:sign_column, s:invert_signs)
call s:HL('SynthwaveYellowSign', s:gb.yellow, s:sign_column, s:invert_signs)
call s:HL('SynthwaveBlueSign', s:gb.blue, s:sign_column, s:invert_signs)
call s:HL('SynthwavePurpleSign', s:gb.purple, s:sign_column, s:invert_signs)
call s:HL('SynthwaveAquaSign', s:gb.aqua, s:sign_column, s:invert_signs)
call s:HL('SynthwaveOrangeSign', s:gb.orange, s:sign_column, s:invert_signs)

call s:HL('SynthwaveRedUnderline', s:none, s:none, s:undercurl, s:gb.red)
call s:HL('SynthwaveGreenUnderline', s:none, s:none, s:undercurl, s:gb.green)
call s:HL('SynthwaveYellowUnderline', s:none, s:none, s:undercurl, s:gb.yellow)
call s:HL('SynthwaveBlueUnderline', s:none, s:none, s:undercurl, s:gb.blue)
call s:HL('SynthwavePurpleUnderline', s:none, s:none, s:undercurl, s:gb.purple)
call s:HL('SynthwaveAquaUnderline', s:none, s:none, s:undercurl, s:gb.aqua)
call s:HL('SynthwaveOrangeUnderline', s:none, s:none, s:undercurl, s:gb.orange)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:gb.fg1, s:gb.bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/synthwave/issues/7
if exists('v:vim_did_enter')
  let g:synthwave_vim_did_enter = v:vim_did_enter
else
  augroup SynthwaveVimEnter
    au!
    autocmd VimEnter * let g:synthwave_vim_did_enter = 1
  augroup End
endif
if get(g:, 'synthwave_vim_did_enter', 0)
  if s:is_dark
    set background=dark
  else
    set background=light
  endif
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:gb.bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:gb.bg4, s:gb.bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:tabline_sel, s:gb.bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:gb.bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:gb.blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:gb.yellow, s:gb.bg1)
endif

hi! link NonText SynthwaveBg2
hi! link SpecialKey SynthwaveFg4

call s:HL('Visual',    s:none,  s:gb.bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search', s:hls_highlight, s:gb.bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:gb.bg0, s:inverse)

call s:HL('QuickFixLine', s:gb.bg0, s:gb.yellow, s:bold)

call s:HL('Underlined', s:gb.blue, s:none, s:underline)

call s:HL('StatusLine',   s:gb.bg2, s:gb.fg1, s:inverse)
call s:HL('StatusLineNC', s:gb.bg1, s:gb.fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:gb.bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:gb.blue, s:gb.bg2, s:bold)

" Directory names, special names in listing
hi! link Directory SynthwaveGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title SynthwaveGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:gb.bg0, s:gb.red, s:bold)
" More prompt: -- More --
hi! link MoreMsg SynthwaveYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg SynthwaveYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question SynthwaveOrangeBold
" Warning messages
hi! link WarningMsg SynthwaveRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:gb.bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gb.gray, s:gb.bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gb.gray, s:gb.bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:synthwave_improved_strings == 0
  hi! link Special SynthwaveOrange
else
  call s:HL('Special', s:gb.orange, s:gb.bg1, s:italicize_strings)
endif

" call s:HL('Comment', s:gb.gray, s:none, s:italicize_comments)
call s:HL('Comment', s:fg4, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:none, s:bold . s:italic)
call s:HL('Error', s:gb.red, s:none, s:bold . s:inverse)

" Generic statement
hi! link Statement SynthwaveRed
" if, then, else, endif, swicth, etc.
hi! link Conditional SynthwaveRed
" for, do, while, etc.
hi! link Repeat SynthwaveRed
" case, default, etc.
hi! link Label SynthwaveRed
" try, catch, throw
hi! link Exception SynthwaveRed
" sizeof, "+", "*", etc.
hi! link Operator SynthwaveFg1
" Any other keyword
hi! link Keyword SynthwaveRed

" Variable name
hi! link Identifier SynthwaveBlue
" Function name
hi! link Function SynthwaveGreenBold

" Generic preprocessor
hi! link PreProc SynthwaveAqua
" Preprocessor #include
hi! link Include SynthwaveAqua
" Preprocessor #define
hi! link Define SynthwaveAqua
" Same as Define
hi! link Macro SynthwaveAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit SynthwaveAqua

" Generic constant
hi! link Constant SynthwavePurple
" Character constant: 'c', '/n'
hi! link Character SynthwavePurple
" String constant: "this is a string"
if g:synthwave_improved_strings == 0
  call s:HL('String',  s:gb.green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:gb.fg1, s:gb.bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean SynthwavePurple
" Number constant: 234, 0xff
hi! link Number SynthwavePurple
" Floating point constant: 2.3e10
hi! link Float SynthwavePurple

" Generic type
hi! link Type SynthwaveYellow
" static, register, volatile, etc
hi! link StorageClass SynthwaveOrange
" struct, union, enum, etc.
hi! link Structure SynthwaveAqua
" typedef
hi! link Typedef SynthwaveYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:gb.fg1, s:gb.bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:gb.bg2, s:gb.blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:gb.bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:gb.bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:gb.red, s:gb.bg0, s:inverse)
call s:HL('DiffAdd',    s:gb.green, s:gb.bg0, s:inverse)
"call s:HL('DiffChange', s:gb.bg0, s:gb.blue)
"call s:HL('DiffText',   s:gb.bg0, s:gb.yellow)

" Alternative setting
call s:HL('DiffChange', s:gb.aqua, s:gb.bg0, s:inverse)
call s:HL('DiffText',   s:gb.yellow, s:gb.bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:synthwave_improved_warnings == 0
    hi! link SpellCap SynthwaveBlueUnderline
  else
    call s:HL('SpellCap',   s:gb.green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  hi! link SpellBad SynthwaveRedUnderline
  " Wrong spelling for selected region
  hi! link SpellLocal SynthwaveAquaUnderline
  " Rare word
  hi! link SpellRare SynthwavePurpleUnderline
endif

" }}}
" LSP: {{{

hi! link LspDiagnosticsDefaultError SynthwaveRed
hi! link LspDiagnosticsSignError SynthwaveRedSign
hi! link LspDiagnosticsUnderlineError SynthwaveRedUnderline

hi! link LspDiagnosticsDefaultWarning SynthwaveYellow
hi! link LspDiagnosticsSignWarning SynthwaveYellowSign
hi! link LspDiagnosticsUnderlineWarning SynthwaveYellowUnderline

hi! link LspDiagnosticsDefaultInformation SynthwaveBlue
hi! link LspDiagnosticsSignInformation SynthwaveBlueSign
hi! link LspDiagnosticsUnderlineInformation SynthwaveBlueUnderline

hi! link LspDiagnosticsDefaultHint SynthwaveAqua
hi! link LspDiagnosticsSignHint SynthwaveAquaSign
hi! link LspDiagnosticsUnderlineHint SynthwaveAquaUnderline

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget SynthwaveYellowBold
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:synthwave_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:gb.bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:gb.bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:gb.bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:gb.bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:gb.bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:gb.bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd SynthwaveGreenSign
hi! link GitGutterChange SynthwaveAquaSign
hi! link GitGutterDelete SynthwaveRedSign
hi! link GitGutterChangeDelete SynthwaveAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile SynthwaveGreen
hi! link gitcommitDiscardedFile SynthwaveRed

" }}}
" Signify: {{{

hi! link SignifySignAdd SynthwaveGreenSign
hi! link SignifySignChange SynthwaveAquaSign
hi! link SignifySignDelete SynthwaveRedSign

" }}}
" Syntastic: {{{

hi! link SyntasticError SynthwaveRedUnderline
hi! link SyntasticWarning SynthwaveYellowUnderline

hi! link SyntasticErrorSign SynthwaveRedSign
hi! link SyntasticWarningSign SynthwaveYellowSign

" }}}
" Termdebug: {{{

call s:HL('debugPC', s:none, s:gb.faded_blue)
hi! link debugBreakpoint SynthwaveRedSign

" }}}

" Signature: {{{
hi! link SignatureMarkText   SynthwaveBlueSign
hi! link SignatureMarkerText SynthwavePurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl SynthwaveBlueSign
hi! link ShowMarksHLu SynthwaveBlueSign
hi! link ShowMarksHLo SynthwaveBlueSign
hi! link ShowMarksHLm SynthwaveBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch SynthwaveYellow
hi! link CtrlPNoEntries SynthwaveRed
hi! link CtrlPPrtBase SynthwaveBg2
hi! link CtrlPPrtCursor SynthwaveBlue
hi! link CtrlPLinePre SynthwaveBg2

call s:HL('CtrlPMode1', s:gb.blue, s:gb.bg2, s:bold)
call s:HL('CtrlPMode2', s:gb.bg0, s:gb.blue, s:bold)
call s:HL('CtrlPStats', s:gb.fg4, s:gb.bg2, s:bold)

" }}}
" FZF: {{{

let g:fzf_colors = {
      \ 'fg':      ['fg', 'SynthwaveFg1'],
      \ 'bg':      ['fg', 'SynthwaveBg0'],
      \ 'hl':      ['fg', 'SynthwaveYellow'],
      \ 'fg+':     ['fg', 'SynthwaveFg1'],
      \ 'bg+':     ['fg', 'SynthwaveBg1'],
      \ 'hl+':     ['fg', 'SynthwaveYellow'],
      \ 'info':    ['fg', 'SynthwaveBlue'],
      \ 'prompt':  ['fg', 'SynthwaveFg4'],
      \ 'pointer': ['fg', 'SynthwaveBlue'],
      \ 'marker':  ['fg', 'SynthwaveOrange'],
      \ 'spinner': ['fg', 'SynthwaveYellow'],
      \ 'header':  ['fg', 'SynthwaveBg3']
      \ }

call s:HL('Fzf1', s:gb.blue, s:gb.bg1)
call s:HL('Fzf2', s:gb.orange, s:gb.bg1)
call s:HL('Fzf3', s:gb.fg4, s:gb.bg1)

" }}}
" Startify: {{{

hi! link StartifyBracket SynthwaveFg3
hi! link StartifyFile SynthwaveFg1
hi! link StartifyNumber SynthwaveBlue
hi! link StartifyPath SynthwaveGray
hi! link StartifySlash SynthwaveGray
hi! link StartifySection SynthwaveYellow
hi! link StartifySpecial SynthwaveBg2
hi! link StartifyHeader SynthwaveOrange
hi! link StartifyFooter SynthwaveBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:gb.bg4[0], s:gb.red[0], s:gb.green[0], s:gb.yellow[0],
  \ s:gb.blue[0], s:gb.purple[0], s:gb.aqua[0], s:gb.fg4[0],
  \ s:gb.bg0[0], s:gb.red[0], s:gb.green[0], s:gb.orange[0],
  \ s:gb.blue[0], s:gb.purple[0], s:gb.aqua[0], s:gb.fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:gb.bg0, s:gb.fg4)
call s:HL('BufTabLineActive', s:gb.fg4, s:gb.bg2)
call s:HL('BufTabLineHidden', s:gb.bg4, s:gb.bg1)
call s:HL('BufTabLineFill', s:gb.bg0, s:gb.bg0)

" }}}
" Asynchronous Lint Engine: {{{

hi! link ALEError SynthwaveRedUnderline
hi! link ALEWarning SynthwaveYellowUnderline
hi! link ALEInfo SynthwaveBlueUnderline

hi! link ALEErrorSign SynthwaveRedSign
hi! link ALEWarningSign SynthwaveYellowSign
hi! link ALEInfoSign SynthwaveBlueSign

hi! link ALEVirtualTextError SynthwaveRed
hi! link ALEVirtualTextWarning SynthwaveYellow
hi! link ALEVirtualTextInfo SynthwaveBlue

" }}}
" Dirvish: {{{

hi! link DirvishPathTail SynthwaveAqua
hi! link DirvishArg SynthwaveYellow

" }}}
" Netrw: {{{

hi! link netrwDir SynthwaveAqua
hi! link netrwClassify SynthwaveAqua
hi! link netrwLink SynthwaveGray
hi! link netrwSymLink SynthwaveFg1
hi! link netrwExe SynthwaveYellow
hi! link netrwComment SynthwaveGray
hi! link netrwList SynthwaveBlue
hi! link netrwHelpCmd SynthwaveAqua
hi! link netrwCmdSep SynthwaveFg3
hi! link netrwVersion SynthwaveGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir SynthwaveAqua
hi! link NERDTreeDirSlash SynthwaveAqua

hi! link NERDTreeOpenable SynthwaveOrange
hi! link NERDTreeClosable SynthwaveOrange

hi! link NERDTreeFile SynthwaveFg1
hi! link NERDTreeExecFile SynthwaveYellow

hi! link NERDTreeUp SynthwaveGray
hi! link NERDTreeCWD SynthwaveGreen
hi! link NERDTreeHelp SynthwaveFg1

hi! link NERDTreeToggleOn SynthwaveGreen
hi! link NERDTreeToggleOff SynthwaveRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:gb.bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign SynthwaveRedSign
hi! link CocWarningSign SynthwaveOrangeSign
hi! link CocInfoSign SynthwaveBlueSign
hi! link CocHintSign SynthwaveAquaSign
hi! link CocErrorFloat SynthwaveRed
hi! link CocWarningFloat SynthwaveOrange
hi! link CocInfoFloat SynthwaveBlue
hi! link CocHintFloat SynthwaveAqua
hi! link CocDiagnosticsError SynthwaveRed
hi! link CocDiagnosticsWarning SynthwaveOrange
hi! link CocDiagnosticsInfo SynthwaveBlue
hi! link CocDiagnosticsHint SynthwaveAqua

hi! link CocSelectedText SynthwaveRed
hi! link CocCodeLens SynthwaveGray

hi! link CocErrorHighlight SynthwaveRedUnderline
hi! link CocWarningHighlight SynthwaveOrangeUnderline
hi! link CocInfoHighlight SynthwaveBlueUnderline
hi! link CocHintHighlight SynthwaveAquaUnderline

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded SynthwaveGreen
hi! link diffRemoved SynthwaveRed
hi! link diffChanged SynthwaveAqua

hi! link diffFile SynthwaveOrange
hi! link diffNewFile SynthwaveYellow

hi! link diffLine SynthwaveBlue

" }}}
" Html: {{{

hi! link htmlTag SynthwaveAquaBold
hi! link htmlEndTag SynthwaveAquaBold

hi! link htmlTagName SynthwaveBlue
hi! link htmlArg SynthwaveOrange

hi! link htmlScriptTag SynthwavePurple
hi! link htmlTagN SynthwaveFg1
hi! link htmlSpecialTagName SynthwaveBlue

call s:HL('htmlLink', s:gb.fg4, s:none, s:underline)

hi! link htmlSpecialChar SynthwaveRed

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag SynthwaveAquaBold
hi! link xmlEndTag SynthwaveAquaBold
hi! link xmlTagName SynthwaveBlue
hi! link xmlEqual SynthwaveBlue
hi! link docbkKeyword SynthwaveAquaBold

hi! link xmlDocTypeDecl SynthwaveGray
hi! link xmlDocTypeKeyword SynthwavePurple
hi! link xmlCdataStart SynthwaveGray
hi! link xmlCdataCdata SynthwavePurple
hi! link dtdFunction SynthwaveGray
hi! link dtdTagName SynthwavePurple

hi! link xmlAttrib SynthwaveOrange
hi! link xmlProcessingDelim SynthwaveGray
hi! link dtdParamEntityPunct SynthwaveGray
hi! link dtdParamEntityDPunct SynthwaveGray
hi! link xmlAttribPunct SynthwaveGray

hi! link xmlEntity SynthwaveRed
hi! link xmlEntityPunct SynthwaveRed
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:gb.fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation SynthwaveOrange
hi! link vimBracket SynthwaveOrange
hi! link vimMapModKey SynthwaveOrange
hi! link vimFuncSID SynthwaveFg3
hi! link vimSetSep SynthwaveFg3
hi! link vimSep SynthwaveFg3
hi! link vimContinue SynthwaveFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword SynthwaveBlue
hi! link clojureCond SynthwaveOrange
hi! link clojureSpecial SynthwaveOrange
hi! link clojureDefine SynthwaveOrange

hi! link clojureFunc SynthwaveYellow
hi! link clojureRepeat SynthwaveYellow
hi! link clojureCharacter SynthwaveAqua
hi! link clojureStringEscape SynthwaveAqua
hi! link clojureException SynthwaveRed

hi! link clojureRegexp SynthwaveAqua
hi! link clojureRegexpEscape SynthwaveAqua
call s:HL('clojureRegexpCharClass', s:gb.fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen SynthwaveFg3
hi! link clojureAnonArg SynthwaveYellow
hi! link clojureVariable SynthwaveBlue
hi! link clojureMacro SynthwaveOrange

hi! link clojureMeta SynthwaveYellow
hi! link clojureDeref SynthwaveYellow
hi! link clojureQuote SynthwaveYellow
hi! link clojureUnquote SynthwaveYellow

" }}}
" C: {{{

hi! link cOperator SynthwavePurple
hi! link cppOperator SynthwavePurple
hi! link cStructure SynthwaveOrange

" }}}
" Python: {{{

hi! link pythonBuiltin SynthwaveOrange
hi! link pythonBuiltinObj SynthwaveOrange
hi! link pythonBuiltinFunc SynthwaveOrange
hi! link pythonFunction SynthwaveAqua
hi! link pythonDecorator SynthwaveRed
hi! link pythonInclude SynthwaveBlue
hi! link pythonImport SynthwaveBlue
hi! link pythonRun SynthwaveBlue
hi! link pythonCoding SynthwaveBlue
hi! link pythonOperator SynthwaveRed
hi! link pythonException SynthwaveRed
hi! link pythonExceptions SynthwavePurple
hi! link pythonBoolean SynthwavePurple
hi! link pythonDot SynthwaveFg3
hi! link pythonConditional SynthwaveRed
hi! link pythonRepeat SynthwaveRed
hi! link pythonDottedName SynthwaveGreenBold

" }}}
" CSS: {{{

hi! link cssBraces SynthwaveBlue
hi! link cssFunctionName SynthwaveYellow
hi! link cssIdentifier SynthwaveOrange
hi! link cssClassName SynthwaveGreen
hi! link cssColor SynthwaveBlue
hi! link cssSelectorOp SynthwaveBlue
hi! link cssSelectorOp2 SynthwaveBlue
hi! link cssImportant SynthwaveGreen
hi! link cssVendor SynthwaveFg1

hi! link cssTextProp SynthwaveAqua
hi! link cssAnimationProp SynthwaveAqua
hi! link cssUIProp SynthwaveYellow
hi! link cssTransformProp SynthwaveAqua
hi! link cssTransitionProp SynthwaveAqua
hi! link cssPrintProp SynthwaveAqua
hi! link cssPositioningProp SynthwaveYellow
hi! link cssBoxProp SynthwaveAqua
hi! link cssFontDescriptorProp SynthwaveAqua
hi! link cssFlexibleBoxProp SynthwaveAqua
hi! link cssBorderOutlineProp SynthwaveAqua
hi! link cssBackgroundProp SynthwaveAqua
hi! link cssMarginProp SynthwaveAqua
hi! link cssListProp SynthwaveAqua
hi! link cssTableProp SynthwaveAqua
hi! link cssFontProp SynthwaveAqua
hi! link cssPaddingProp SynthwaveAqua
hi! link cssDimensionProp SynthwaveAqua
hi! link cssRenderProp SynthwaveAqua
hi! link cssColorProp SynthwaveAqua
hi! link cssGeneratedContentProp SynthwaveAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces SynthwaveFg1
hi! link javaScriptFunction SynthwaveAqua
hi! link javaScriptIdentifier SynthwaveRed
hi! link javaScriptMember SynthwaveBlue
hi! link javaScriptNumber SynthwavePurple
hi! link javaScriptNull SynthwavePurple
hi! link javaScriptParens SynthwaveFg3

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword GruvboxAqua
hi! link jsExtendsKeyword GruvboxAqua
hi! link jsExportDefault GruvboxAqua
hi! link jsTemplateBraces GruvboxAqua
hi! link jsGlobalNodeObjects GruvboxBlue
hi! link jsGlobalObjects GruvboxBlue
hi! link jsObjectKey GruvboxGreenBold
hi! link jsFunction GruvboxAqua
hi! link jsFuncCall GruvboxBlue
hi! link jsFuncParens GruvboxFg3
hi! link jsParens GruvboxFg3
hi! link jsNull GruvboxPurple
hi! link jsUndefined GruvboxPurple
hi! link jsClassDefinition GruvboxYellow
hi! link jsOperatorKeyword GruvboxRed

" }}}
" YAJS: {{{

hi! link javascriptImport SynthwaveAqua
hi! link javascriptExport SynthwaveAqua
hi! link javascriptClassKeyword SynthwaveAqua
hi! link javascriptClassExtends SynthwaveAqua
hi! link javascriptDefault SynthwaveAqua

hi! link javascriptClassName SynthwaveYellow
hi! link javascriptClassSuperName SynthwaveYellow
hi! link javascriptGlobal SynthwaveYellow

hi! link javascriptEndColons SynthwaveFg1
hi! link javascriptFuncArg SynthwaveFg1
hi! link javascriptGlobalMethod SynthwaveFg1
hi! link javascriptNodeGlobal SynthwaveFg1
hi! link javascriptBOMWindowProp SynthwaveFg1
hi! link javascriptArrayMethod SynthwaveFg1
hi! link javascriptArrayStaticMethod SynthwaveFg1
hi! link javascriptCacheMethod SynthwaveFg1
hi! link javascriptDateMethod SynthwaveFg1
hi! link javascriptMathStaticMethod SynthwaveFg1

" hi! link javascriptProp SynthwaveFg1
hi! link javascriptURLUtilsProp SynthwaveFg1
hi! link javascriptBOMNavigatorProp SynthwaveFg1
hi! link javascriptDOMDocMethod SynthwaveFg1
hi! link javascriptDOMDocProp SynthwaveFg1
hi! link javascriptBOMLocationMethod SynthwaveFg1
hi! link javascriptBOMWindowMethod SynthwaveFg1
hi! link javascriptStringMethod SynthwaveFg1

hi! link javascriptVariable SynthwaveOrange
" hi! link javascriptVariable SynthwaveRed
" hi! link javascriptIdentifier SynthwaveOrange
" hi! link javascriptClassSuper SynthwaveOrange
hi! link javascriptIdentifier SynthwaveOrange
hi! link javascriptClassSuper SynthwaveOrange

" hi! link javascriptFuncKeyword SynthwaveOrange
" hi! link javascriptAsyncFunc SynthwaveOrange
hi! link javascriptFuncKeyword SynthwaveAqua
hi! link javascriptAsyncFunc SynthwaveAqua
hi! link javascriptClassStatic SynthwaveOrange

hi! link javascriptOperator SynthwaveRed
hi! link javascriptForOperator SynthwaveRed
hi! link javascriptYield SynthwaveRed
hi! link javascriptExceptions SynthwaveRed
hi! link javascriptMessage SynthwaveRed

hi! link javascriptTemplateSB SynthwaveAqua
hi! link javascriptTemplateSubstitution SynthwaveFg1

" hi! link javascriptLabel SynthwaveBlue
" hi! link javascriptObjectLabel SynthwaveBlue
" hi! link javascriptPropertyName SynthwaveBlue
hi! link javascriptLabel SynthwaveFg1
hi! link javascriptObjectLabel SynthwaveFg1
hi! link javascriptPropertyName SynthwaveFg1

hi! link javascriptLogicSymbols SynthwaveFg1
hi! link javascriptArrowFunc SynthwaveYellow

hi! link javascriptDocParamName SynthwaveFg4
hi! link javascriptDocTags SynthwaveFg4
hi! link javascriptDocNotation SynthwaveFg4
hi! link javascriptDocParamType SynthwaveFg4
hi! link javascriptDocNamedParamType SynthwaveFg4

hi! link javascriptBrackets SynthwaveFg1
hi! link javascriptDOMElemAttrs SynthwaveFg1
hi! link javascriptDOMEventMethod SynthwaveFg1
hi! link javascriptDOMNodeMethod SynthwaveFg1
hi! link javascriptDOMStorageMethod SynthwaveFg1
hi! link javascriptHeadersMethod SynthwaveFg1

hi! link javascriptAsyncFuncKeyword SynthwaveRed
hi! link javascriptAwaitFuncKeyword SynthwaveRed

" }}}
" TypeScript: {{{

hi! link typescriptReserved SynthwaveAqua
hi! link typescriptLabel SynthwaveAqua
hi! link typescriptFuncKeyword SynthwaveAqua
hi! link typescriptIdentifier SynthwaveOrange
hi! link typescriptBraces SynthwaveFg1
hi! link typescriptEndColons SynthwaveFg1
hi! link typescriptDOMObjects SynthwaveFg1
hi! link typescriptAjaxMethods SynthwaveFg1
hi! link typescriptLogicSymbols SynthwaveFg1
hi! link typescriptDocSeeTag Comment
hi! link typescriptDocParam Comment
hi! link typescriptDocTags vimCommentTitle
hi! link typescriptGlobalObjects SynthwaveFg1
hi! link typescriptParens SynthwaveFg3
hi! link typescriptOpSymbols SynthwaveFg3
hi! link typescriptHtmlElemProperties SynthwaveFg1
hi! link typescriptNull SynthwavePurple
hi! link typescriptInterpolationDelimiter SynthwaveAqua

" }}}
" JSX: maxmellon/vim-jsx-pretty: {{{

hi! link jsxTagName SynthwaveAqua
hi! link jsxComponentName SynthwaveGreen
hi! link jsxCloseString SynthwaveFg4
hi! link jsxAttrib SynthwaveYellow
hi! link jsxEqual SynthwaveAqua

"}}}
" PureScript: {{{

hi! link purescriptModuleKeyword SynthwaveAqua
hi! link purescriptModuleName SynthwaveFg1
hi! link purescriptWhere SynthwaveAqua
hi! link purescriptDelimiter SynthwaveFg4
hi! link purescriptType SynthwaveFg1
hi! link purescriptImportKeyword SynthwaveAqua
hi! link purescriptHidingKeyword SynthwaveAqua
hi! link purescriptAsKeyword SynthwaveAqua
hi! link purescriptStructure SynthwaveAqua
hi! link purescriptOperator SynthwaveBlue

hi! link purescriptTypeVar SynthwaveFg1
hi! link purescriptConstructor SynthwaveFg1
hi! link purescriptFunction SynthwaveFg1
hi! link purescriptConditional SynthwaveOrange
hi! link purescriptBacktick SynthwaveOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter SynthwaveGreen
hi! link rubyInterpolationDelimiter SynthwaveAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier SynthwaveRed
hi! link objcDirective SynthwaveBlue

" }}}
" Go: {{{

hi! link goDirective SynthwaveAqua
hi! link goConstants SynthwavePurple
hi! link goDeclaration SynthwaveRed
hi! link goDeclType SynthwaveBlue
hi! link goBuiltins SynthwaveOrange

" }}}
" Lua: {{{

hi! link luaIn SynthwaveRed
hi! link luaFunction SynthwaveAqua
hi! link luaTable SynthwaveOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp SynthwaveFg3
hi! link moonExtendedOp SynthwaveFg3
hi! link moonFunction SynthwaveFg3
hi! link moonObject SynthwaveYellow

" }}}
" Java: {{{

hi! link javaAnnotation SynthwaveBlue
hi! link javaDocTags SynthwaveAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen SynthwaveFg3
hi! link javaParen1 SynthwaveFg3
hi! link javaParen2 SynthwaveFg3
hi! link javaParen3 SynthwaveFg3
hi! link javaParen4 SynthwaveFg3
hi! link javaParen5 SynthwaveFg3
hi! link javaOperator SynthwaveOrange

hi! link javaVarArg SynthwaveGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter SynthwaveGreen
hi! link elixirInterpolationDelimiter SynthwaveAqua

hi! link elixirModuleDeclaration SynthwaveYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition SynthwaveFg1
hi! link scalaCaseFollowing SynthwaveFg1
hi! link scalaCapitalWord SynthwaveFg1
hi! link scalaTypeExtension SynthwaveFg1

hi! link scalaKeyword SynthwaveRed
hi! link scalaKeywordModifier SynthwaveRed

hi! link scalaSpecial SynthwaveAqua
hi! link scalaOperator SynthwaveFg1

hi! link scalaTypeDeclaration SynthwaveYellow
hi! link scalaTypeTypePostDeclaration SynthwaveYellow

hi! link scalaInstanceDeclaration SynthwaveFg1
hi! link scalaInterpolation SynthwaveAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:gb.fg3, s:none, s:italic)

hi! link markdownH1 SynthwaveGreenBold
hi! link markdownH2 SynthwaveGreenBold
hi! link markdownH3 SynthwaveYellowBold
hi! link markdownH4 SynthwaveYellowBold
hi! link markdownH5 SynthwaveYellow
hi! link markdownH6 SynthwaveYellow

hi! link markdownCode SynthwaveAqua
hi! link markdownCodeBlock SynthwaveAqua
hi! link markdownCodeDelimiter SynthwaveAqua

hi! link markdownBlockquote SynthwaveGray
hi! link markdownListMarker SynthwaveGray
hi! link markdownOrderedListMarker SynthwaveGray
hi! link markdownRule SynthwaveGray
hi! link markdownHeadingRule SynthwaveGray

hi! link markdownUrlDelimiter SynthwaveFg3
hi! link markdownLinkDelimiter SynthwaveFg3
hi! link markdownLinkTextDelimiter SynthwaveFg3

hi! link markdownHeadingDelimiter SynthwaveOrange
hi! link markdownUrl SynthwavePurple
hi! link markdownUrlTitleDelimiter SynthwaveGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

hi! link haskellType SynthwaveBlue
hi! link haskellIdentifier SynthwaveAqua
hi! link haskellSeparator SynthwaveFg4
hi! link haskellDelimiter SynthwaveOrange
hi! link haskellOperators SynthwavePurple

hi! link haskellBacktick SynthwaveOrange
hi! link haskellStatement SynthwavePurple
hi! link haskellConditional SynthwavePurple

hi! link haskellLet SynthwaveRed
hi! link haskellDefault SynthwaveRed
hi! link haskellWhere SynthwaveRed
hi! link haskellBottom SynthwaveRedBold
hi! link haskellImportKeywords SynthwavePurpleBold
hi! link haskellDeclKeyword SynthwaveOrange
hi! link haskellDecl SynthwaveOrange
hi! link haskellDeriving SynthwavePurple
hi! link haskellAssocType SynthwaveAqua

hi! link haskellNumber SynthwaveAqua
hi! link haskellPragma SynthwaveRedBold

hi! link haskellTH SynthwaveAquaBold
hi! link haskellForeignKeywords SynthwaveGreen
hi! link haskellKeyword SynthwaveRed
hi! link haskellFloat SynthwaveAqua
hi! link haskellInfix SynthwavePurple
hi! link haskellQuote SynthwaveGreenBold
hi! link haskellShebang SynthwaveYellowBold
hi! link haskellLiquid SynthwavePurpleBold
hi! link haskellQuasiQuoted SynthwaveBlueBold
hi! link haskellRecursiveDo SynthwavePurple
hi! link haskellQuotedType SynthwaveRed
hi! link haskellPreProc SynthwaveFg4
hi! link haskellTypeRoles SynthwaveRedBold
hi! link haskellTypeForall SynthwaveRed
hi! link haskellPatternKeyword SynthwaveBlue

" }}}
" Json: {{{

hi! link jsonKeyword SynthwaveGreen
hi! link jsonQuote SynthwaveGreen
hi! link jsonBraces SynthwaveFg1
hi! link jsonString SynthwaveFg1

" }}}
" Mail: {{{

" Override some defaults defined by mail.vim
" mail quoted text
hi! link mailQuoted1 GruvBoxAqua
hi! link mailQuoted2 GruvBoxPurple
hi! link mailQuoted3 GruvBoxYellow
hi! link mailQuoted4 GruvBoxGreen
hi! link mailQuoted5 GruvBoxRed
hi! link mailQuoted6 GruvBoxOrange

hi! link mailSignature Comment

" }}}
" C#: {{{

hi! link csBraces SynthwaveFg1
hi! link csEndColon SynthwaveFg1
hi! link csLogicSymbols SynthwaveFg1
hi! link csParens SynthwaveFg3
hi! link csOpSymbols SynthwaveFg3
hi! link csInterpolationDelimiter SynthwaveFg3
hi! link csInterpolationAlignDel SynthwaveAquaBold
hi! link csInterpolationFormat SynthwaveAqua
hi! link csInterpolationFormatDel SynthwaveAquaBold

" }}}
" Rust: {{{

hi! link rustSigil SynthwaveOrange
hi! link rustEscape SynthwaveAqua
hi! link rustStringContinuation SynthwaveAqua
hi! link rustEnum SynthwaveAqua
hi! link rustStructure SynthwaveAqua
hi! link rustModPathSep SynthwaveFg2
hi! link rustCommentLineDoc Comment
hi! link rustDefault SynthwaveAqua

" }}}
" Ocaml: {{{

hi! link ocamlOperator SynthwaveFg1
hi! link ocamlKeyChar SynthwaveOrange
hi! link ocamlArrow SynthwaveOrange
hi! link ocamlInfixOpKeyword SynthwaveRed
hi! link ocamlConstructor SynthwaveOrange

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! SynthwaveHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! SynthwaveHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
