-- https://github.com/hrsh7th/nvim-cmp
PACKER.use {
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-path' },
	config = function()
		local cmp = require('cmp')
		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup {
			sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "orgmode" },
				{ name = "path" },
			},

			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			-- mapping = {
			-- 	['<C-Space>'] = cmp.mapping.complete(),
			-- 	['<CR>'] = cmp.mapping.confirm(),
			-- 	['<Tab>'] = cmp.mapping(function(fallback)
   --     				if cmp.visible() then
   --         				cmp.select_next_item()
   --     					if luasnip.expand_or_jumpable() then
   --         					luasnip.expand_or_jump()
			-- 			end
   --     				elseif luasnip.expand_or_jumpable() then
   --     					luasnip.expand_or_jump()
   --     				elseif has_words_before() then
   --     					cmp.complete()
   --     				else
   --     					fallback()
   --     				end
   --     			end, { "i", "s" }),
			--
   --     			['<S-Tab>'] = cmp.mapping(function(fallback)
   --     				if cmp.visible() then
   --         				-- cmp.select_prev_item()
   --     				elseif luasnip.jumpable(-1) then
   --         				luasnip.jump(-1)
   --     				else
   --         				fallback()
   --     				end
   --     			end, { "i", "s" }),
   --     		},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
		}
	end
}

