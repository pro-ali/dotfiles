	" Author: pro-ali
	" Creation: 2018-4-5
	" Contact: ali@alipro.co.uk

	if &compatible
	set nocompatible
	endif

	" DEIN CONFIGURATION (plugin mangager) --------------------------------------
	" ---------------------------------------------------------------------------
		set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
		if dein#load_state('~/.config/nvim/dein/')
		call dein#begin('~/.config/nvim/dein/')
			call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
			call dein#add('Shougo/neosnippet.vim',        {'if': 1,})
			call dein#add('Shougo/neosnippet-snippets',   {'if': 1,})
			call dein#add('scrooloose/nerdcommenter',     {'if': 1,})
			call dein#add('scrooloose/nerdtree',          {'if': 1,})
			call dein#add('vim-syntastic/syntastic',      {'if': 1,})
			call dein#add('Valloric/YouCompleteMe',       {'if': 1,})
			call dein#add('SirVer/ultisnips',             {'if': 1,})
			call dein#add('honza/vim-snippets',           {'if': 1,})
			call dein#add('python-mode/python-mode',      {'if': 1,})
			"call dein#add('Shougo/deol.nvim',             {'rev': 'a1b5108fd'})
			call dein#add('majutsushi/tagbar',            {'if': 1,})
			call dein#add('ctrlpvim/ctrlp.vim',           {'if': 1,}, {'for': 'tex',})
			call dein#add('tpope/vim-capslock',           {'if': 1,})
			call dein#add('cohama/lexima.vim',            {'if': 1,})
			call dein#add('easymotion/vim-easymotion',    {'if': 1,})
			call dein#add('airblade/vim-rooter',          {'if': 1,})
			call dein#add('mattn/emmet-vim',              {'if': 1,})
			call dein#add('rafi/awesome-vim-colorschemes', {'if': 1,})
			call dein#add('qualiabyte/vim-colorstepper', {'if': 1,})
		call dein#end()
		call dein#save_state()
		endif
		if dein#check_install()
		call dein#install()
		endif
		"if dein#check_update()
		"call dein#update()
		"endif

	" NVIM CONFIGURATIONS -------------------------------------------------------
	" ---------------------------------------------------------------------------
		" BASIC SETTINGS --------------------------------------------------------
		" -----------------------------------------------------------------------
			set showcmd
			set showmode
			"set ruler
			"set relativenumber
			"set nonumber
			set undofile
			set undodir=~/.config/nvim/undodir
			"set mouse=a
			set tabstop=4
			set shiftwidth=4
			set encoding=utf-8
			set splitbelow
			set splitright
			set ignorecase
			set incsearch

		" SCROLL CONTROLS--------------------------------------------------------
		" -----------------------------------------------------------------------
			set scrolloff=8
			set sidescrolloff=15
			set sidescroll=1

		" COLORSCHEMES ----------------------------------------------------------
		" -----------------------------------------------------------------------
			"colorscheme PaperColor
			colorscheme blue

		" HIGHLIGHTING CONFIGS --------------------------------------------------
		" -----------------------------------------------------------------------
			highlight Folded ctermbg=000
			highlight FoldColumn ctermbg=000
			highlight clear EvenLines
			highlight EvenLines ctermbg=black
			highlight OddLines ctermbg=grey
			syntax match Tab /\t/
			hi Tab gui=underline guifg=blue ctermbg=blue
			nnoremap <leader>, :noh<cr>

		" AUTOCOMMANDS ----------------------------------------------------------
		" -----------------------------------------------------------------------
			augroup my_insert_mode
				autocmd!
				"autocmd VimEnter * :set nonumber
				"autocmd BufEnter * :set nonumber
				"autocmd InsertEnter * :set norelativenumber
				"autocmd InsertLeave * :set relativenumber
				"au BufReadCmd   *.epub      call zip#Browse(expand("<amatch>"))
				autocmd BufNewFile * 
							\ silent! 0r
							\ $HOME/.config/nvim/templates/%:e.skeleton
			augroup END


		" MAPPINGS --------------------------------------------------------------
		" -----------------------------------------------------------------------
			let mapleader = " "

			" INCREMENT/DECREMENT NUMBERS ---------------------------------------
			" -------------------------------------------------------------------
				nnoremap <leader>aa <c-a>
				vnoremap <leader>al g<c-a>
				nnoremap <leader>ad <c-x>

			" TOGGLE NUMBERED LINES ---------------------------------------------
			" -------------------------------------------------------------------
				nnoremap <leader>n :set number!<cr>

			" VIEW PY3 DOCS -----------------------------------------------------
			" -------------------------------------------------------------------
				" <C-H> over pykeyword/method/etc to instant view docs   
				nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
			
			" X11 PASTING ( "+ register ) ---------------------------------------
			" -------------------------------------------------------------------
				nnoremap <leader>pa "+p

			" EDITING VIMRC FILE MAPPINGS ---------------------------------------
			" -------------------------------------------------------------------
				nnoremap <leader>ev :tabnew $MYVIMRC<cr>

			" TERMINAL INTERACTION IN NVIM --------------------------------------
			" -------------------------------------------------------------------
				nnoremap <leader>xx :<c-p><cr>
				nnoremap <leader>xt :terminal<cr>A
				nnoremap <leader>xn :terminal python -m

        " GENERAL EDITING ---------------------------------------------------
        " -------------------------------------------------------------------
            " ESCAPE EDIT MODE ( convenience mapping ) ----------------------
            " ---------------------------------------------------------------
                inoremap jk <esc>
                inoremap jl <esc><Right>a
                inoremap jn <esc>o
                inoremap <esc> <nop>

            " BRIEF EDITING FROM NORMAL MODE --------------------------------
            " ---------------------------------------------------------------
                nnoremap <cr> o<esc>

            " BREAK-LINE MAPPINGS -------------------------------------------
            " ---------------------------------------------------------------
                " Enter Capslock with <C-L> when in insert mode see:
                " ":h capslock "
                nnoremap <leader>ihs o# <esc>80a-<esc>077ldeyypk0f-R
                nnoremap <leader>ihd o# <esc>80a=<esc>077ldeyypk0f=R
                nnoremap <leader>ifs o/* <esc>80a-<esc>074ldea */<esc>yypk0f-R
                nnoremap <leader>ifd o/* <esc>80a=<esc>074ldea */<esc>yypk0f=R
                nnoremap <leader>ias o" <esc>80a-<esc>077ldeyypk0f-R
                nnoremap <leader>iad o" <esc>80a=<esc>077ldeyypk0f=R
                "nnoremap <leader>its 73a-<esc>o<esc>
                "nnoremap <leader>itd 73a=<esc>o<esc>
                nnoremap <leader>sc /    " <cr>077lde
                nnoremap <leader>sh /    # <cr>077lde:noh<cr>b

        " TEMPLATE EDITING --------------------------------------------------
        " -------------------------------------------------------------------
            " WHITE-SPACE & TABS ( highlighting and guided removal ) --------
            " ---------------------------------------------------------------
                nnoremap <leader>ws :%s/\s\+$//gc<cr>
                nnoremap <leader>st :%s/\t/    /gc<cr>

            " PYTHON --------------------------------------------------------
            " ---------------------------------------------------------------
                nnoremap <leader>pt 
                    \Gddgg
                    \4jA <C-R>=expand("%:t%:r")<cr><esc>2j
                    \A <C-R>=strftime("%Y-%m-%d")<cr><esc>jA<space>

                nnoremap <leader>cp 
                    \Gddgg
                    \1jA <C-R>=expand("%:t%:r")<cr><esc>2j
                    \A <C-R>=strftime("%Y-%m-%d")<cr><esc>jA<space>

            " INTERNAL_CSS_CODE ---------------------------------------------
            " ---------------------------------------------------------------
				nnoremap <leader>cs I/* <esc>A */<esc>0w
				nnoremap <leader>cr 0wxxxA<esc>vhhx

            " JOURNAL MARKINGS ----------------------------------------------
            " ---------------------------------------------------------------
                nnoremap <leader>dl 
                    \I<C-R>=strftime("Date: %Y %m %d . Time: %H:%M:%S")
                    \<cr><cr><Tab>

            " BUFFER HANDLING ( e.g. saving, sourcing, etc, ... ) -----------
            " ---------------------------------------------------------------
                nnoremap <leader>ww :w<cr>
                nnoremap <leader>ee :wq<cr>
                nnoremap <leader>ei :q!<cr>
                nnoremap <leader>so :so $MYVIMRC<cr>

            " SAVE ALL BUFFERS ON LEAVING & RESUME AT LAST LOCATION ---------
            " ---------------------------------------------------------------
                augroup window_controls
                    autocmd FocusLost,WinLeave * :silent! wa
                    " When editing a file, always jump to the last known
                    " cursor position. Don't do it for commit messages,
                    " when the position is invalid, or when inside an
                    " event handler (happens when dropping a file on gvim).
                    autocmd BufReadPost * 
                      \ if &ft != 'gitcommit' && line("'\"") > 0 &&
                      \ line("'\"") <= line("$") |
                      \   exe "normal g`\"" |
                      \ endif

                augroup END

    " SPLIT WINDOW MAPPINGS -------------------------------------------------
    " -----------------------------------------------------------------------
        set diffopt+=vertical

        " RESIZING WINDOWS --------------------------------------------------
        " -------------------------------------------------------------------
            nnoremap <silent> <Right> :vertical resize +5<cr>
            nnoremap <silent> <Left> :vertical resize -5<cr>
            nnoremap <silent> <Up> :resize +5<cr>
            nnoremap <silent> <Down> :resize -5<cr>

        " WINDOW SCROWLLING AND CENTERING -----------------------------------
        " -------------------------------------------------------------------
            nnoremap j jzz
            nnoremap k kzz
            nnoremap l lzz
            nnoremap h hzz
            nnoremap <c-d> <c-d>jzz
            nnoremap <c-u> <c-u>kzz

    " NAVIGATION MAPPINGS ---------------------------------------------------
    " -----------------------------------------------------------------------
        " SEARCH-ITERATION SHORTCUTS ( swap of existing for convenience ) ---
        " -------------------------------------------------------------------
            nnoremap # *
            nnoremap * #
            nnoremap n nzz
            nnoremap N Nzz

        " BLOCK NAVIGATION MAPPINGS ( bracket hopping ) ---------------------
        " -------------------------------------------------------------------
            nnoremap <tab> %
            vnoremap <tab> %


        " NAVIGATING SPLIT-WINDOWS ------------------------------------------
        " -------------------------------------------------------------------
            nnoremap <C-h> <C-w>h
            nnoremap <C-j> <C-w>j
            nnoremap <C-k> <C-w>k
            nnoremap <C-l> <C-w>l

        " TABBED WINDOW NAVIGATION ------------------------------------------
        " -------------------------------------------------------------------
            nnoremap <leader>h gT
            nnoremap <leader>l gt

    " SPECIAL CHARS ----------------------------------------------------------
    " ------------------------------------------------------------------------
        " ALPHABETIC DIGRAPHS ( in addition to existing ) -----------------------
        " -----------------------------------------------------------------------
			" subSCRIPT
            execute "digraphs as " . 0x2090
            execute "digraphs es " . 0x2091
            execute "digraphs is " . 0x1D62
            execute "digraphs os " . 0x2092
            execute "digraphs us " . 0x1D64
            execute "digraphs hs " . 0x2095
            execute "digraphs js " . 0x2C7C
            execute "digraphs ks " . 0x2096
            execute "digraphs ls " . 0x2097
            execute "digraphs ms " . 0x2098
            execute "digraphs ns " . 0x2099
            execute "digraphs ps " . 0x209A
            execute "digraphs rs " . 0x1D63
            execute "digraphs ss " . 0x209B
            execute "digraphs ts " . 0x209C
            execute "digraphs vs " . 0x1D65
            execute "digraphs xs " . 0x2093
            execute "digraphs *s " . 0x0359

			" MATH-SYMBOLS
            execute "digraphs *. " . 0x22C5

			" SupERSCRIPT
			execute "digraphs cS " . 0x1D9C
            execute "digraphs kS " . 0x1D4F
            execute "digraphs xS " . 0x1D61
            execute "digraphs *S " . 0x20F0

			" CALLIGRAPHIC
			execute "digraphs Sc " . 0x1D9C
			execute "digraphs cP " . 0x1D4AB

			" MATHEMATICAL BOLD SCRIPT
			execute "digraphs mF " . 0x1D4D5
			execute "digraphs mP " . 0x1D4DF
			execute "digraphs mR " . 0x1D4E1

			" DOUBLE-STRUCK
			execute "digraphs dE " . 0x1D53C

			" RE-ASSIGNMENT
			" >> ♠ (ctrl-k, cS -->)
			execute "digraphs c1 " . 0x2660
			" >> ♀ (ctrl-k, mF -->)
			execute "digraphs mf " . 0x2660


        " CHAR SHORTCUTS ---------------------------------------------------------
        " ------------------------------------------------------------------------
            nnoremap <leader>cm 
                \I🗹--<esc>0
                \A ---[<C-R>=strftime("%Y.%m.%d _ %H:%M:%S")<cr>]<esc>0

            nnoremap <leader>ct 
                \I🗹-🗹<esc>0
                \A ---[<C-R>=strftime("%Y.%m.%d _ %H:%M:%S")<cr>]<esc>0

" PLUGIN CONFIGURATIONS -----------------------------------------------------
" ---------------------------------------------------------------------------
    " DEIN ( requirements ) -------------------------------------------------
    " -----------------------------------------------------------------------
        syntax on
        filetype plugin indent on

    " SYNTASTIC -------------------------------------------------------------
    " -----------------------------------------------------------------------
        let g:syntastic_aggregate_errors = 1
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_cursor_column = 0
        let g:syntastic_id_checkers = 1
        let g:syntastic_python_checkers = ["falke8", "python", "pep8"]
        "let g:syntastic_python_checker_args="--ignore=E501,W601"

    " NERDTREE --------------------------------------------------------------
    " -----------------------------------------------------------------------
        nnoremap <leader>t :NERDTreeToggle<cr>

    " YOUCOMPLETEME ---------------------------------------------------------
    " -----------------------------------------------------------------------
        " install, otherwise errors ensue:
        "  $ pip install neovim
        "  $ sudo -H pip3 install neovim
        " -----------------------------------------------------------------
        let g:ycm_key_list_select_completion = ['<C-n>']
        let g:ycm_key_list_previous_completion = ['<C-p>']
        "let g:SuperTabDefaultCompletionType = '<C-n>'

    " ULTISNIPS -------------------------------------------------------------
    " -----------------------------------------------------------------------
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " TAGBAR ----------------------------------------------------------------
    " -----------------------------------------------------------------------
        "nnoremap <F8> :TagbarToggle<CR>
		nnoremap <leader><leader>b :TagbarToggle<CR>

    " PYTHON-MODE -----------------------------------------------------------
    " -----------------------------------------------------------------------
        let g:pymode_python = 'python3'

    " VIM-ROOTER ------------------------------------------------------------
    " -----------------------------------------------------------------------
        " SOURCE: https://github.com/airblade/vim-rooter
        " -------------------------------------------------------------------
        let g:rooter_change_directory_for_non_project_files = 'current'
        let g:rooter_patterns = ['Rakefile', '.git/']
        let g:rooter_use_lcd = 1
        let g:rooter_resolve_links = 1

    " VIM-COLORSTEPPER ------------------------------------------------------
    " -----------------------------------------------------------------------
		nmap <F6> <Plug>ColorstepPrev
		nmap <F7> <Plug>ColorstepNext
		nmap <S-F7> <Plug>ColorstepReload
