-- git config --global --unset http.proxy
-- git config --global --unset https.proxy
require("configs.basic")
require("configs.markdown")
require("configs.nerdcommenter")
---require("configs.nerdtree")

require("configs.tex")
require("run_debug.python")
require("run_debug.c")
require("run_debug.cpp")
-- require("lsp.nvimcmp")
-- require("lsp.cmpnvimlsp")
-- require("lsp.nvimlspconfig")
vim.g.python3_host_prog = "C:\\Users\\86132\\AppData\\Local\\Programs\\python\\python311\\python.exe"
-- vim.g.python3_host_prog = "\\C\\Users\\86132\\AppData\\Local\\Microsoft\\WindowsApps\\python3.exe"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- init.lua
-- vim.api.nvim_set_keymap("n", "<C-v>", "<C-v>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-v>", "<C-v>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", "<C-v>", "<C-v>", { noremap = true, silent = true })
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- colorscheme tokyonight-night  -storm   -day   -moon
require("lazy").setup({
	{ import = "plugins_lsp_cmp" },
	{ import = "plugins" },
	{ import = "plugins_common" },
	{ import = "plugins_md" },
	{ import = "plugins_tex" },
	{ import = "plugins_debug" },
	{ "mhartington/formatter.nvim", config = true },
})
-- require('lspconfig').pyright.setup{
-- cmd = { 'pyright-langserver', '--stdio' },
-- }
vim.cmd.colorscheme("vscode")
-- vim.cmd([[colorscheme tokyonight-storm]])
-- vim.cmd([[colorscheme darkplus]])
-- 设置 lspconfig 使其自动补全功能与 nvim-cmp 集成
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- require('lspconfig').clangd.setup {
--   capabilities = capabilities,
-- }
-- vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Prettier<CR>', { noremap = true, silent = true })
-- require('lspconfig').pyright.setup {
--   capabilities = capabilities,
-- }
require("lsp-format").setup({})

local on_attach = function(client, bufnr)
	require("lsp-format").on_attach(client, bufnr)

	-- ... custom code ...
end
require("lspconfig").gopls.setup({ on_attach = on_attach })
