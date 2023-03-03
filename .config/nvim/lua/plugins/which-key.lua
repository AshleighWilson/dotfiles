-- https://github.com/folke/which-key.nvim
return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup {
		}

		local wk = require("which-key")

		wk.register({
			["<leader>b"] = { name = "+buffer" },
			["<leader>bc"] = {"<cmd>bd<cr>", "Close Buffer" },
			["<leader>bf"] = {"<cmd>Telescope buffers<cr>", "Find Buffer" },

			["<leader>f"] = { name = "+file" },
			["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
			["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
			["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
			["<leader>ft"] = { "<cmd>NvimTreeFindFile!<CR>", "View Filesystem Tree" },
			["<leader>fh"] = { "<cmd>NvimTreeOpen $HOME<CR>", "View Home Directory"},

			["<leader>n"] = { name = "+neovim" },
			["<leader>np"] = { name = "+packer" },
			["<leader>nps"] = { "<cmd>PackerSync<cr>", "Packer Sync" },

			["<leader>c"] = { name = "+code" },
			["<leader>cb"] = { "<cmd>make<cr>", "Build" },
			["<leader>cu"] = { "<cmd>make all upload<cr>", "Build and Upload" },
			["<leader>cs"] = { "<cmd>lua _serial_device_toggle()<CR>", "Connect to serial device" },
			["<leader>cg"] = { "<cmd>lua _lazygit_toggle()<CR>", "Open LazyGit" },

			["<leader>p"] = { "<cmd>Telescope project<CR>", "projects" },

			["<leader>w"] = { name = "+window" },
			["<leader>wq"] = { "<cmd>quit<CR>", "close window" },
			["<leader>ws"] = { "<cmd>new<CR>", "horizontal split" },
			["<leader>wv"] = { "<cmd>vnew<CR>", "vertical split" },
		},
		{
		})

		-- Orgmode
		-- https://github.com/nvim-orgmode/orgmode
		-- These are in a function so that they can be loaded ONLY for Org buffers.
		function org_keymaps()
		wk.register({
			['<leader>o']  = { name = "orgmode" },
			["<leader>o'"] = { '<Cmd>lua require("orgmode").action("org_mappings.edit_special")<CR>', "Edit Code Block" },
			['<leader>o$'] = { '<Cmd>lua require("orgmode").action("org_mappings.archive")<CR>', "Archive Subtree" },
			['<leader>o*'] = { '<Cmd>lua require("orgmode").action("org_mappings.toggle_heading")<CR>', "Toggle Headline" },
			['<leader>o,'] = { '<Cmd>lua require("orgmode").action("org_mappings.set_priority")<CR>', "Set Priority" },
			['<leader>oA'] = { '<Cmd>lua require("orgmode").action("agenda.toggle_archive_tag")<CR>', "Toggle Archive" },
			['<leader>oJ'] = { '<Cmd>lua require("orgmode").action("org_mappings.move_subtree_down")<CR>', "Move Subtree Down" },
			['<leader>oK'] = { '<Cmd>lua require("orgmode").action("org_mappings.move_subtree_up")<CR>', "Move Subtree Up" },
			['<leader>oa'] = { '<Cmd>lua require("orgmode").action("agenda.prompt")<CR>', "Open Agenda" },
			['<leader>oc'] = { '<Cmd>lua require("orgmode").action("capture.prompt")<CR>', "Capture" },
			['<leader>oe'] = { '<Cmd>lua require("orgmode").action("org_mappings.export")<CR>', "Export" },
			['<leader>ok'] = { '<Cmd>lua require("orgmode").action("capture.kill")<CR>', "Kill Capture" },
			['<leader>oo'] = { '<Cmd>lua require("orgmode").action("org_mappings.open_at_point")<CR>', "Follow Link/Date" },
			['<leader>or'] = { '<Cmd>lua require("orgmode").action("capture.refile_headline_to_destination")<CR>', "Refile" },
			['<leader>ot'] = { '<Cmd>lua require("orgmode").action("org_mappings.set_tags")<CR>', "Tag" },
			['<leader>oi'] = { name = "Insert" },
			['<leader>oi!'] = { '<Cmd>lua require("orgmode").action("org_mappings.org_timestamp", "true")<CR>', "Timestamp (Inactive)" },
			['<leader>oi.'] = { '<Cmd>lua require("orgmode").action("org_mappings.org_timestamp")<CR>', "Timestamp" },
			['<leader>oiT'] = { '<Cmd>lua require("orgmode").action("org_mappings.insert_todo_heading")<CR>', "TODO (Immediate)" },
			['<leader>oid'] = { '<Cmd>lua require("orgmode").action("org_mappings.org_deadline")<CR>', "Deadline" },
			['<leader>oih'] = { '<Cmd>lua require("orgmode").action("org_mappings.insert_heading_respect_content")<CR>', "Heading" },
			['<leader>ois'] = { '<Cmd>lua require("orgmode").action("org_mappings.org_schedule")<CR>', "Schedule" },
			['<leader>oit'] = { '<Cmd>lua require("orgmode").action("org_mappings.insert_todo_heading_respect_content")<CR>', "TODO" },
			['<leader>ox'] = { name = "Clock" },
			['<leader>oxe'] = { '<Cmd>lua require("orgmode").action("agenda.set_effort")<CR>', "Set Effort" },
			['<leader>oxi'] = { '<Cmd>lua require("orgmode").action("agenda.clock_in")<CR>', "Clock In" },
			['<leader>oxj'] = { '<Cmd>lua require("orgmode").action("clock.org_clock_goto")<CR>', "Goto Clock" },
			['<leader>oxo'] = { '<Cmd>lua require("orgmode").action("agenda.clock_out")<CR>', "Clock Out" },
			['<leader>oxq'] = { '<Cmd>lua require("orgmode").action("agenda.clock_cancel")<CR>', "Cancel Clock" },
		}, { })
		end

		-- Orgmode
		augroup('orgmode', {
		"FileType org :set conceallevel=2",
		"FileType org :set concealcursor=nc",
		"FileType org :set autochdir",
		"FileType org :lua org_keymaps()",
		})

	end
}


