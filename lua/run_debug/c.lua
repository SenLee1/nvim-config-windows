--local dap = require("dap")
--
--dap.adapters.cppdbg = {
--	id = "cppdbg",
--	type = "executable",
--	command = "D:\\PATH\\cpptools-windows-x64\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
--	options = {
--		detached = false,
--	}
--}
--dap.configuration.cpp = {
--	name = "Launch file",
--	type = "cppdbg",
--	request = "launch",
--	program = function()
--		return vim.fn.input('Path to executable: ',vim.fn.getcwd() .. '/', 'file')
--	end,
--	cwd = '${workspaceFolder}',
--	stopAtEntry = true,
--},
--setupCommands = {  
--	{ 
--		text = '-enable-pretty-printing',
--		description =  'enable pretty printing',
--		ignoreFailures = false 
--	},
--},
--dap.configurations.c = dap.configurations.cpp
--dap.configurations.rust = dap.configurations.cpp
