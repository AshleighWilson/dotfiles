-- Documentation: https://github.com/neovim/nvim-lspconfig
return {
	'neovim/nvim-lspconfig',
	dependencies = { 'hrsh7th/cmp-nvim-lsp', 'saadparwaiz1/cmp_luasnip' },
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		-- C/C++ (ccls)
		require('lspconfig').ccls.setup {
			capabilities = capabilities,
		}

		-- python
		require'lspconfig'.pyright.setup {
		}

		-- lua (lua-language-server - https://github.com/sumneko/lua-language-server)
		local runtime_path = vim.split(package.path, ';')
		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")
		require'lspconfig'.lua_ls.setup {
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
		-- yaml
		require("lspconfig").yamlls.setup{
			settings = {
				yaml = {
					schemas = {
						["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
					},
				},
			}
		}

		-- html
		--Enable (broadcasting) snippet capability for completion
		require("lspconfig").html.setup {
			capabilities = capabilities,
			filetypes = { "html", "htmldjango" },
			init_options = {
				configurationSection = { "htmldjango", "html", "css", "javascript" },
			}
		}

		-- markdown
		require'lspconfig'.marksman.setup{}

		-- javascript
		-- FIX: Not attached to buffer at present
		require('lspconfig').eslint.setup{
			capabilities = capabilities,
			filetypes = { 'html', 'htmldjango' }
		}

		require('lspconfig').cssls.setup{
			capabilities = capabilities,
		}

		require('lspconfig').tsserver.setup{
			capabilities = capabilities,
		}

    require('lspconfig').pylsp.setup{
      settings = {
        pylsp = {
          plugins = {
            pydocstyle = { enabled = true },
            mypy = { enabled = true }
          }
        }
      }

    }
	end
}
