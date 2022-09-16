-- Documentation: https://github.com/glepnir/dashboard-nvim
PACKER.use {
	'glepnir/dashboard-nvim',
	requires = {},
	config = function()
		vim.g.dashboard_default_executive = "telescope"
	end,

}

local dashboard = require('dashboard')

dashboard.custom_header = {
  "                                                       ",
  "                                                       ",
  "                                                       ",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  "                                                       ",
  "                                                       ",
  "                                                       ",
  "                                                       ",
}

dashboard.custom_center = {
  {
    icon = "  ",
    desc = "Find  File                              ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
    shortcut = "<Leader> ff",
  },
  {
    icon = "  ",
    desc = "Recently opened files                   ",
    action = "Telescope oldfiles",
    shortcut = "<Leader> fr",
  },
  {
    icon = "  ",
    desc = "Open project                            ",
    action = "Telescope project",
    shortcut = "<Leader> cp",
  },
  {
    icon = "  ",
    desc = "Open Nvim config                        ",
    action = "tabnew $MYVIMRC | tcd %:p:h",
    shortcut = "<Leader> ev",
  },
  {
    icon = "  ",
    desc = "New file                                ",
    action = "enew",
    shortcut = "n          ",
  },
  {
    icon = "  ",
    desc = "Quit Nvim                               ",
    action = "qa",
    shortcut = "q          ",
  },
}

vim.cmd([[
  augroup dashboard_enter
    au!
    autocmd FileType dashboard nnoremap <buffer> q :qa<CR>
    autocmd FileType dashboard nnoremap <buffer> n :enew<CR>
  augroup END
]])
