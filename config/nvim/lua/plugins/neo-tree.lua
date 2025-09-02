return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- recomendado para ícones
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		filesystem = {
			filtered_items = {
				visible = true, -- Garante que itens filtrados (como os do .gitignore) fiquem visíveis, porém com uma cor mais esmaecida.
				hide_dotfiles = false, -- A linha mais importante: diz para NÃO esconder os dotfiles.
				hide_gitignored = true, -- Mantém os arquivos do .gitignore escondidos, o que geralmente é desejável.
			},
		},
	},
	config = function()
		vim.keymap.set({ "n", "i" }, "<C-b>", "<Cmd>Neotree toggle filesystem reveal right<CR>", {})
	end,
}
