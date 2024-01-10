local M = {}

-- vim.cmd([[
--   command! -range -nargs=0 MoveUnits <line1>,<line2>s/\v - (\s*\w+\S*)(.*)$/ - \2 (\1)/
-- ]])

M.disabled = {
  i = {
    ["<C-s>"] = "",
  },

  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<C-f>"] = "",
    ["<C-q>"] = "",
    ["<C-p>"] = "",
    ["<C-n>"] = "",
    ["<C-e>"] = "",
    ["<C-i>"] = "",
    ["<C-I>"] = "",
    ["<C-o>"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
    -- Harpoon -- ["C-`"] = "",
    ["<leader>h"] = "",
    ["<leader>fp"] = "",
    ["<leader>a"] = "", 
    ["<leader>1"] = "", 
    ["<leader>2"] = "", 
    ["<leader>3"] = "", 
    -- git worktree, tele cmd hist
    ["<leader>ft"] = "",
    ["<leader>fc"] = "",
  },
  v = {
    ["<C-c>"] = "",
    ["<leader>m"] = "",
    ["<leader>t"] = "",
    ["<leader>d"] = "",
    ["<leader>s"] = "",
    ["<leader>w"] = "",
  }, 
  x = { 
    ["<C-c>"] = "",
    ["<leader>m"] = "",
    ["<leader>t"] = "",
    ["<leader>d"] = "",
    ["<leader>s"] = "",
    ["<leader>w"] = "",
  }
}

M.custom = {
  i = {
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "write" },
    ["<C-w>"] = { "<ESC><cmd> wq <CR>", "write/quit" },
    ["<C-S-q>"] = { "<ESC><cmd> qa! <CR>", "quit all!" },
    -- page jump keep cursor in place
    ["<C-d>"] = { "<C-d>zz", "PgDn keep center" },
    ["<C-u>"] = { "<C-u>zz", "PgUp keep center" },
  },

  n = {
    -- Line nums, notif, wrap
    ["<leader>nl"] = { "<cmd> set nu! <CR> <cmd> set rnu! <CR>", "toggle all line number" },
    ["<leader>nn"] = { "<cmd> Notifications <CR>", "notifications" },
    ["<leader>nm"] = {
      "<cmd> lua require('telescope').extensions.notify.notify() <CR>",
      "notification search"
    },
    ["<leader>nw"] = { "<cmd> set wrap! <CR>", "toggle wrap" },
    ["<leader>nq"] = { "<cmd> qa! <CR>", "quit all!" },
    ["<leader>wq"] = { "<cmd> wq! <CR>", "write quit!" },
    ["<leader>ww"] = { "gwip", "rewrap" },
    ["<leader><leader>"] = { ":", "cmdline" },
    -- toggle tree
    ["<C-f>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<F8>"] = { "<cmd> TagbarToggle <CR>", "toggle tagbar" },
    ["<leader>ns"] = { "<cmd> lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
    -- save quit 
    ["<C-S-q>"] = { "<cmd> qa! <CR>", "quit all!" },
    ["<C-s>"] = { "<cmd> w <CR>", "write" },
    ["<C-q>"] = { "<cmd> wq! <CR>", "write quit!" },
    -- telescope
    ["<C-p>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    -- switch between windows
    ["<C-n>"] = { "<C-w>h", "window left" },
    ["<C-e>"] = { "<C-w>j", "window down" },
    ["<C-i>"] = { "<C-w>k", "window up" },
    ["<C-I>"] = { "<C-w>k", "window up" },
    ["<C-Right>"] = { "<C-w>l", "window right" },
    ["<C-Left>"] = { "<C-w>h", "window left" },
    ["<C-Down>"] = { "<C-w>j", "window down" },
    ["<C-Up>"] = { "<C-w>k", "window up" },
    -- git 
    ["<leader>gl"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
    ["<leader>gw"] = { "<cmd> Gitsigns toggle_current_line_blame <CR>", "git blame toggle" },
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>gh"] = {
      function()
          require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },
    ["<leader>gu"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
    ["<leader>ga"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Add buffer",
    },
    -- undo tree
    ["<leader>gt"] = { "<cmd> UndotreeToggle <CR>", "Undo Tree" },
    -- page jump keep cursor in place
    ["<C-d>"] = { "<C-d>zz", "PgDn keep center" },
    ["<C-u>"] = { "<C-u>zz", "PgUp keep center" },
    ["<ScrollWheelDown>"] = { "<C-d>zz", "PgDn keep center" },
    ["<ScrollWheelUp>"] = { "<C-u>zz", "PgUp keep center" },
    -- Harpoon 
    -- ["C-`"] = {"<cmd> lua require('harpoon.tmux').gotoTerminal('{last}') <CR>", "Harp ToTerm"}, 
    ["<leader>a"] = {"<cmd> lua require('harpoon.mark').add_file() <CR>", "Harp Add"}, 
    ["<leader>h"] = {"<cmd> lua require('harpoon.ui').toggle_quick_menu() <CR>", "Harp Menu"}, 
    ["<leader>fp"]={"<cmd> Telescope harpoon marks <CR>", "Harp Menu"}, 
    ["<leader>1"] = {"<cmd> lua require('harpoon.ui').nav_file(1) <CR>", "Harp 1"}, 
    ["<leader>2"] = {"<cmd> lua require('harpoon.ui').nav_file(2) <CR>", "Harp 2"}, 
    ["<leader>3"] = {"<cmd> lua require('harpoon.ui').nav_file(3) <CR>", "Harp 3"},
    -- git worktree
    ["<leader>ft"] = {"<cmd> lua require('telescope').extensions.git_worktree.git_worktrees() <CR>", "Git Worktree"},
    ["<leader>fc"] = {"<cmd> Telescope command_history <CR>", "command history"},
  },

  v = {
    -- ["<leader>m"] = {"<cmd>MoveUnits<CR>", "Last word parens"}, -- Managed elsewhere
    ["<C-c>"] = {"<cmd> '<,'>w !xclip -selection clipboard <CR>", "Copy system clipboard"},
    ["<leader>t"] = {"<cmd>'<,'>s/\\<.\\u&/g <CR>", "Set title case"},
    ["<leader>d"] = {[[<cmd>'<,'>s/\n/\r\r/g<CR>]], "Double space"},
    ["<leader>s"] = {[[<cmd>'<,'>s/\n\n/\r/g<CR>]], "Single space"},
    ["<leader>w"] = {"<cmd>norm! gwip<CR>", "Rewrap"},
  },
  x = { 
    -- ["<leader>m"] = {"<cmd>MoveUnits<CR>", "Last word parens"}, -- Managed elsewhere
    ["<C-c>"] = {"<cmd> '<,'>w !xclip -selection clipboard <CR>", "Copy system clipboard"},
    ["<leader>t"] = {"<cmd> '<,'>s/\\<.\\u&/g <CR>", "Set title case"},
    ["<leader>d"] = {[[<cmd>'<,'>s/\n/\r\r/g<CR>]], "Double space"},
    ["<leader>s"] = {[[<cmd>'<,'>s/\n\n/\r/g<CR>]], "Single space"},
    ["<leader>w"] = {"<cmd>norm! gwip<CR>", "Rewrap"},
  }

}

return M
