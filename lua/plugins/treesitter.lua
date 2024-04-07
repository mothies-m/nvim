return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
        require('nvim-treesitter.install').compilers = { 'zig' }
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"typescript",
				"javascript",
				"c",
				"lua",
				"python",
				"vim",
				"vimdoc",
				"query",
				"xml",
				"vue",
                "css"
			},

			auto_install = false,

			sync_install = false,

			highlight = {
				enable = true,
			},
		})
	end,
}
