--Tab Spaceing
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

--copy and paste support
vim.g.clipboard = {
    name = "macOS-clipboard",
    copy = {
        ['+'] = 'pbcopy',
        ['*'] = 'pbcopy',
    },
    paste = {
        ['+'] = 'pbpaste',
        ['*'] = 'pbpaste',
    },
    cache_enabled = 0
}
vim.api.nvim_set_keymap('v', '<C-c>', '"*y', {noremap = true, silent = true})
-- 

vim.g.mapleader = " "

--ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

require("typing_test")

-- Keymaps
-- Saving
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>x", ":wqa<CR>", { noremap = true, silent = true, desc = "Save and Quit All" })

-- Panes
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>sc", ":close<CR>", { noremap = true, silent = true, desc = "Close Pane" })

-- Navigation hjkl
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { noremap = true, silent = true, desc = "Pane Left" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { noremap = true, silent = true, desc = "Pane Down" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { noremap = true, silent = true, desc = "Pane Up" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { noremap = true, silent = true, desc = "Pane Right" })

--telescope defined in plugin config
--vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
--vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- LSP Keybinds

-- Signature help
vim.keymap.set("n", "<leader>0", vim.lsp.buf.signature_help, { buffer = true, desc = "Signature Help" })

-- Hover documentation
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })

-- Code action
--vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Open diagnostic float
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { desc = "Open Diagnostic Float" })

-- Populate location list with diagnostics
vim.keymap.set(
	"n",
	"<leader>E",
	vim.diagnostic.setloclist,
	{ noremap = true, silent = true, desc = "Diagnostics to Location List" }
)

vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { desc = "Open Diagnostic Float" })

