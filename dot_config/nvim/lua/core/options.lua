local option = vim.opt

option.termguicolors = true
vim.cmd.colorscheme("habamax")

-- Line options
option.number = true
option.relativenumber = true
option.cursorline = true
option.wrap = false -- no line wrap by default

option.scrolloff = 10 --keep 10 lines above/below the cursor
option.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

-- Indent
option.tabstop = 2 
option.shiftwidth = 2 -- indent width
option.softtabstop = 2
option.expandtab = true -- use spaces instead of tabs
option.smartindent = true
option.autoindent = true --copy indent from current line

-- Search
option.ignorecase = true
option.smartcase = true -- case sensitive if uppercase in string
option.hlsearch = true -- highlight search matches
option.incsearch = true -- show the matches as you type
option.path:append("**") -- Include subdirs in search
-- 
option.signcolumn = "yes"
option.colorcolumn = "100" -- position of the column in chars

option.showmatch = true -- highlight matching brackets

option.cmdheight = 1 -- single line commandline

option.completeopt = "menuone,noinsert,noselect"

option.showmode = false 

option.pumheight = 10
option.pumblend = 10

option.winblend = 0

option.conceallevel = 0 
option.concealcursor = ""
option.lazyredraw = true
option.synmaxcol = 300
option.fillchars = { eob = " "}

option.backup = false
option.writebackup = false
option.swapfile = false

option.undofile = true
option.undodir = undodir
option.updatetime = 300
option.timeoutlen = 500
option.ttimeoutlen = 0

option.autoread = true
option.autowrite = false

option.hidden = true -- allow hidden buffers
option.errorbells = false
option.backspace = "indent,eol,start"
option.autochdir = false

option.iskeyword:append("-")
option.selection = "inclusive"

option.mouse = "a" -- Enable mouse support

option.clipboard:append("unnamedplus") -- use system clipboard

option.modifiable = true -- Allow Buffer Modifications

option.encoding = "utf-8"

option.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"


option.foldmethod = "expr"
option.foldexpr = "v:lua.vim.treesitter.foldexpr()" --use treesitter for folding
option.foldlevel = 99 --start with all folds open

option.splitbelow = true
option.splitright = true

option.wildmenu = true 
option.wildmode = "longest:full,full"
option.diffopt:append("linematch:60")
option.redrawtime = 10000
option.maxmempattern = 20000



