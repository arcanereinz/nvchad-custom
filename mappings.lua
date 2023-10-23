local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    },
  },
}

-- keybindings for rest.nvim
vim.api.nvim_set_keymap("n", "<Plug>RestNvim", ":lua require('rest-nvim').run()<CR>", { noremap = true})

-- rest.nvim key bindings [NOTE: rename file extension to .http for this to work]
-- https://www.reddit.com/r/neovim/comments/n6cdnl/my_first_neovim_plugin_restnvim/
-- NOTE: add below content to file: ~/.config/nvim/ftdetect/http.vim
-- au BufRead,BufNewFile *.http		set filetype=http
M.rest = {
  n = {
    ["<leader>qr"] = {
      "<Plug>RestNvim<CR>",
      "Run HTTP query",
    },
  }
}

-- also: comment using <leader>/
M.custom = {
  -- fix default copy to clipboard <leader>y copying +1 characters
  v = {
    ["<leader>y"] = {
      '"+y<CR>',
      "Copy to clipboard",
    },
  },
  -- print full path for Ctrl-g
  -- https://vi.stackexchange.com/questions/104/how-can-i-see-the-full-path-of-the-current-file
  n = {
    ["<C-G>"] = {
      ":echo expand('%:p')<CR>",
      "Print full path",
    },
  },
}

return M
