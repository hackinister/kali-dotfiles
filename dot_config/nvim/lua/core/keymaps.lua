-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local key = vim.keymap
-- General Keymaps -------------------

-- use jk to exit insert mode
key.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- better movement in wrapped text
key.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })

key.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

-- Search
key.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
key.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
key.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Movement C=Ctrl
key.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
key.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- ???
key.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
key.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

key.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
key.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

key.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
key.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
key.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
key.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

key.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
key.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
key.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
key.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
key.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
key.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- A entspricht Alt-key
key.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
key.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
key.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
key.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

key.set("v", "<", "<gv", { desc = "Indent left and reselect" })
key.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Zeilen zusammenfassen
key.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- File Path
key.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

key.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

key.set('n', '<C-s>', ':w<CR>', { desc = 'Speichern mit Strg+s' })
key.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Speichern im Insert-Modus' })

-- increment/decrement numbers
key.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
key.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
key.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
key.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

key.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
key.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
key.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
key.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
key.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

