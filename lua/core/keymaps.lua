
local keymap = vim.keymap.set
vim.g.mapleader = " "
-- mappping keys for the windows resizing
keymap('n', "<S-right>", "<cmd>vertical resize -3<cr>")
keymap('n', "<S-left>", "<cmd>vertical resize +3<cr>")
keymap('n', "<S-UP>", "<cmd>resize -3<cr>")
keymap('n', "<S-DOWN>", "<cmd>resize +3<cr>")
-- mapping key for tabs
keymap('n',"<A-UP>","<CMD>+tabmove<CR>")
keymap('n',"<A-DOWN>","<CMD>-tabmove<CR>")
-- Toggle UndoTree
keymap('n',"<leader>uu","<CMD>UndotreeToggle<CR>")
-- Map for terminal
keymap('n',"<leader>tt","<cmd>vsplit | terminal<cr>")

function P(v)
	print(vim.inspect(v))
	return v
end

function FindMapping(map)
	for _, v in pairs(vim.api.nvim_get_keymap('n')) do
		if v["lhs"] == map then
			print(map .. " Found")
			print(vim.inspect(v))
		end
	end
end
