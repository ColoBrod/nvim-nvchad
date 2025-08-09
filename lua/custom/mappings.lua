-- To remap and CapsLock adjust XKBOPTIONS in /etc/default/keyboard

---@type MappingsTable
local M = {}
local custom = require('custom.utils')
-- local cmp = require "cmp"

--[[

  vim.cmd docs:
  https://neovim.io/doc/user/lua.html#vim.cmd()

  TODO
  vim.api.nvim_create_autocmd("FocusLost", { callback = trim_trailing_whitespaces })

  Alt + i, Alt + v, Alt + h
    toggle floating terminal, 
    toggle vertical terminal
    toggle horizontal terminal
  Space + v, Space + h
    new vertical terminal, new horizontal temrinal

  Space + pt
    Select hidden terminal

  Nvim-tree
  Ctrl + n
    toggle tree
  Space + e
    focus
  
  a - new file
  A - new Folder

  Buffers
  :b NameOfBuffer (Tab, S-Tab key helps)
  Tab - switch between tabs
  S-Tab - switch between tabs


  This helps to determine keys:
  sed -n l

  :split
  :vsplit
  :resize +1
  :resize -1
  :vresize +1
  :vresize -1
]]

--[[
  :sp
  :vsp
  Ctrl+W Ctrl+W 
    moves between splits
  Ctrl+W h j k l 
    moves active split
  Ctrl+w q
    closes active split
  Ctrl+w 10+
    Increases height ov viewport by 10 lines
  Ctrl+w r (R)
    Rotate (swap 2 splits)

some text goes here
]]

--[[
  Табы.

  " nnoremap tn :tabnew <Space>
  " nnoremap tc :tabclose <CR>
  " nnoremap tk :tabnext <CR>
  " nnoremap tj :tabprev <CR>
  " nnoremap th :tabfirst <CR>
  " nnoremap tl :tablast <CR>
]]
M.general = {
  n = {

    -- Best keybindings of all times:
    [";"] = { ":", "Enter command mode" },
    [":"] = { ";", "Next letter in current line" },

    -- Playing with keyboard layouts:
    -- ["<M-1>"] = { function() vim.print("English") end, "Test English keyboard layout" },
    -- ["<M-2>"] = { function() vim.print("Russian") end, "Test Russian keyboard layout" },

    ["<leader>tn"] = { function() vim.cmd(":tabnew") end, "Create new tab"},
    ["<leader>tc"] = { function() vim.cmd(":tabclose") end, "Create new tab"},
    ["<leader>tk"] = { function() vim.cmd(":tabnext") end, "Create new tab"},
    ["<leader>tj"] = { function() vim.cmd(":tabprev") end, "Create new tab"},
    ["<leader>th"] = { function() vim.cmd(":tabfirst") end, "Create new tab"},
    ["<leader>tl"] = { function() vim.cmd(":tablast") end, "Create new tab"},
    -- Resize active split
    -- ["<M-."] = { function() cmd("resize +5") end, "Resize buffer window" },
    -- ["<M-,>"] = { function() cmd("resize -5") end, "Resize buffer window" },
    -- ["<A-[>"] = { function() cmd("vertical resize -1") end, "Resize buffer window" },
    -- ["<A-]>"] = { function() cmd("vertical resize +1") end, "Resize buffer window" },
    ["<M-]>"] = { custom.vresize_view_increase, "Resize view vertically by 5 points" },
    ["<M-[>"] = { custom.vresize_view_decrease, "Resize view vertically by 5 points" },
    ["<M-=>"] = { custom.resize_view_increase, "Resize view horizontally by 5 points" },
    ["<M-->"] = { custom.resize_view_decrease, "Resize view horizontally by 5 points" },

    -- Quickfix bindings
    ["<M-,>"] = { custom.quickfix_prev, "Quick Fix Previous" },
    ["<M-.>"] = { custom.quickfix_next, "Quick Fix Next" },
    ["<leader>co"] = { custom.quickfix_open, "Quick Fix Open" },
    ["<leader>cc"] = { custom.quickfix_close, "Quick Fix Close" },

    -- ["<M-r>"] = { custom.px_to_rem, "Covert px to rem" },

    -- ["<C-w>sv"] = { ":resize ", "Resize buffer window" },
    -- ["<C-w>sh"] = { ":vertical resize ", "Resize buffer window" },
    ["<C-w>rh"] = { ":resize ", "Resize acive buffer horizontally" },
    ["<C-w>rv"] = { ":vertical resize ", "Resize acive buffer vertically" },
    ["<leader>rn"] = { custom.toggle_relative_number, "Toggle relative numbers" },
    ["<leader>tww"] = { custom.toggle_word_wrap, "Toggle word wrap" },
    ["<M-z>"] = { custom.toggle_word_wrap, "Toggle word wrap" },
    ["<C-x>"] = { custom.buffer_close, "Close current buffer" },
    ["<M-d>"] = { custom.diagnostic_text_toggle, "Toggle diagnostic messages" },

    ['<leader>fl'] = { custom.telescope_lsp_references, 'Telescope LSP References' },
    ['<leader>fr'] = { custom.telescope_resume, 'Resume telescope search' },
    ['<leader>fs'] = { custom.telescope_args, 'Search with arguments (file types, paths)' },
    -- keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>") 

    ['<leader>prc'] = { function() vim.cmd(":PxToRemCursor") end, "Convert px to rem. CURSOR" },
    ['<leader>prl'] = { function() vim.cmd(":PxToRemLine") end, "Convert px to rem. LINE" },

    ['<C-k>'] = { function() custom.feedkeys("<C-i>", "n") end, "Next jump"},
    -- ['<F6>'] = { function() custom.feedkeys("<C-o>", "n") end, "Prev jump"},

    -- [""] = {
    -- ["<leader>sh"] = { function() cmd("split") end, "Split window horizontally" },
    -- ["<leader>sv"] = { function() cmd("vsplit") end, "Split window vertically" },
    -- },
    -- ["<F2>"] = { function() require("nvchad.renamer").open() end, "LSP rename" },
  },
  v = {
    [">"] = { ">gv", "indent"},
    -- ["<leader>cv"] = { custom.px_to_rem, "Covert px to rem" },
  },
  i = {
    ["<C-x>"] = { "<Del>", "Remove character under cursor" },
    ["<C-v>"] = { "<C-o>v", "Enter Visual Mode" },
    -- ["<F6>"] = { function() print('test') end, "Complete snippet" },
  },
}

-- 85.38rem
-- 2.00rem
-- 7695.19rem


--[[
Добавить стрелочки в бинды ниже. Вынести перемещение в отдельные функции.

map <A-Down> :move +1<CR>
map <A-Up> :move -2<CR>
]]
vim.keymap.set({ 'n', 'v' }, "\\", "\"+")
vim.keymap.set({ 'n' }, "<F1>", "1gt")
vim.keymap.set({ 'n' }, "<F2>", "2gt")
vim.keymap.set({ 'n' }, "<F3>", "3gt")
vim.keymap.set({ 'n' }, "<F4>", "4gt")

-- Перемещение выделенных строк вверх и вниз
vim.cmd([[
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
]])

-- Мультикурсор.
--[[
  Ctrl+D - 

  Попытка добавить ледер клавишу
  let g:VM_leader = {'default': '\', 'visual': '\', 'buffer': 'z'}
]]
-- vim.cmd([[
--   let g:VM_maps = {}
--   let g:VM_maps['Find Under']         = '<C-d>'
--   let g:VM_maps['Find Subword Under'] = '<C-d>'
--   let g:VM_maps['Add Cursor At Pos'] = '<M-q>'
--   let g:VM_mouse_mappings = 1
-- ]])


--[[
  Добавить кнопку записи, чтения из регистра.

  " Выбрать регистр i
  " nnoremap <F2> "i
  vmap <F2> "+
]]

--[[
  Переключение подсветки поиска

  let hlstate=0
  map <Leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<CR>

  " Подсветка результатов поиска
  set hlsearch
]]
vim.cmd([[
  let hlstate=0
  map <Leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<CR>
  set hlsearch
]])

--[[
  Установить кнопку для открытия терминала. В nvchad уже есть какой-то бинд.

  map <Leader>t :terminal<CR>
]]

vim.opt.keymap = "russian-jcukenwin"
vim.opt.iminsert = 0
vim.opt.imsearch = 0
vim.wo.relativenumber = true
vim.opt.colorcolumn = { "79" , "119" }

-- Перенос строк - по умолчанию отключен
vim.wo.wrap = false

-- Folding options
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldenable = true
-- -- vim.opt.number = true
-- vim.opt.foldlevel = 20
-- vim.opt.foldlevelstart = 20
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
-- vim.opt.fillchars = {  fold = ' ' }

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
-- vim.opt.fillchars = {  fold = 'X' }
-- vim.opt.fillchars.fold = 'X'
-- vim.opt.fillchars:append({fold = " ", foldopen = " ", foldclose = " "})
-- vim.opt.fillchars = { fold = " ", foldopen = " ", foldclose = " " }



-- vim.keymap.set({ 'n', 'v', 'i' }, "<M-1>", function()
--   vim.opt.keymap = ""
--   vim.opt.iminsert = 1
-- end)
--
-- vim.keymap.set({ 'n', 'v', 'i' }, "<M-2>", function()
--   vim.opt.keymap = "russian-jcukenwin"
--   vim.opt.iminsert = 1
-- end)

--[[
  " Сворачивать участки кода по отсупам
  set foldmethod=indent
  " Disable folding
  set nofoldenable    
]]

--[[
  Что это???

  " Режим вставки форматирование, табуляция
  " set paste
  " set nopaste
]]

--[[
  " Automaticaly close nvim if NERDTree is only thing left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Автоматически открывать NERDTree при запуске
  autocmd VimEnter * NERDTree
]]

--[[
  vim.keymap.set('n', '<leader>rn', utils.toggleRelativeNumber)
  vim.keymap.set('n', '<M-j>', utils.moveLineBelow)
  vim.keymap.set('n', '<M-k>', utils.moveLineAbove)
  vim.keymap.set('n', '<M-z>', utils.toggleWordWrap)
  vim.keymap.set('n', '<leader>rl', utils.toggleWordWrap)
  vim.keymap.set('n', '<leader>hl', utils.toggleHighlightSearch)

  -- Номера строк слева
  vim.wo.number = true
  -- Номера строк относительно текущего положения курсора
  vim.wo.relativenumber = true

  -- Добавляем поддержку русской раскладки. Теперь можно переключаться с помощью
  -- Ctrl-^
  vim.opt.keymap = "russian-jcukenwin"
  -- Эти настройки определяют, какая раскладка будет использоваться по умолчанию
  -- в режиме поиска и вставки (командного режима)
  vim.opt.iminsert = 0
  vim.opt.imsearch = 0

  -- Линейки, за которые не стоит выходить при написании кода (гайдлайны)
  vim.opt.colorcolumn = { "79" , "119" }

  -- Подсветка текущего положения курсора
  vim.opt.cursorline = true

  vim.keymap.set('n', '<F12>', utils.reloadConfig)
  

]]

-- vim.opt.foldmethod = "syntax"
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldenable = false
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldlevel = 99
--
-- vim.opt.cursorline = true
vim.o.cursorline = true


-- Отключает уведомления о сохранении файла внизу экрана
-- Необ 
vim.cmd([[ autocmd FocusLost * :wa ]])
-- vim.cmd([[ autocmd BufLeave * :w ]])

-- " Предотвращает добавление комментария на новую строку
-- vim.cmd([[ set formatoptions-=cro ]])

-- vim.api.nvim_create_user_command('RS', function()
--   vim.cmd({ cmd = 'resize', args = { "+10" } })
--   -- vim.fn.Preserve(":")
--   -- pcall(vim.fn.Preserve("exec '%bd|e#|bd#'"))
-- end,{})

-- function moveLineDown()
--   cmd("move +1")
-- end

--[[
  Забиндить кнопку для записи макросов

  nnoremap <F5> @i
  nnoremap <F11> :source ~/.config/nvim/init.vim<CR>
]]

vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 10

return M
