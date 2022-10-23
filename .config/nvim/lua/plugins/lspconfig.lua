-- Documentation: https://github.com/neovim/nvim-lspconfig
PACKER.use {
	'neovim/nvim-lspconfig',
	requires = {
		'hrsh7th/cmp-nvim-lsp',
		'saadparwaiz1/cmp_luasnip'
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		-- C/C++ (ccls)
	 	require('lspconfig').ccls.setup {
				capabilities = capabilities,
	 	}

		-- python
		require'lspconfig'.pyright.setup{}

		-- lua (lua-language-server - https://github.com/sumneko/lua-language-server)
		local runtime_path = vim.split(package.path, ';')
		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")
		require'lspconfig'.sumneko_lua.setup {
				capabilities = capabilities,
				settings = {
				Lua = {
					runtime = {
						version = 'LuaJIT',
						path = runtime_path,
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							'awesome',
							'awful',
							'client',
							'clientkeys',
							'root',
							'screen',
							'vim',
							'gears',
							'wibox'
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							vim.api.nvim_get_runtime_file("", true),
							"/home/ashleigh/.config/nvim/lua/"
						}
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}

	 	-- bash
		require("lspconfig").bashls.setup {
				capabilities = capabilities,
		}
	end
}
