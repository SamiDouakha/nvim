
local keymap = vim.keymap.set

-- mappping keys for the windows resizing
keymap('n', "<c-right>", "<cmd>vertical resize -3<cr>")
keymap('n', "<c-left>", "<cmd>vertical resize +3<cr>")
keymap('n', "<C-UP>", "<cmd>resize -3<cr>")
keymap('n', "<C-DOWN>", "<cmd>resize +3<cr>")

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
