local M = {}

M.disabled = {
  i = {
    -- ["<C-n>"] = "",
    -- ["<C-e>"] = "",
    -- ["<C-i>"] = "",
    -- ["<C-o>"] = "",
    ["<C-s>"] = "",
  },

  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<C-f>"] = "",
    ["<C-q>"] = "",
    ["<C-p>"] = "",
    -- ["k"] = "",
    -- ["K"] = "",
    -- ["m"] = "",
    -- ["M"] = "" ,
    -- ["n"] = "",
    -- ["e"] = "",
    -- ["i"] = "",
    -- ["o"] = "",
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
    ["<leader>td"] = ""
  },
  v = {
    -- ["n"] = "",
    -- ["e"] = "",
    -- ["i"] = "",
    -- ["o"] = "",
  }
}

M.custom = {
  i = {
    -- ["<C-n>"] = { "<Left>", "move left" },
    -- ["<C-e>"] = { "<Down>", "move down" },
    -- ["<C-i>"] = { "<Up>", "move up" },
    -- ["<C-o>"] = { "<Right>", "move right" },
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "write" },
    ["<C-w>"] = { "<ESC><cmd> wq <CR>", "write/quit" },
    ["<C-S-q>"] = { "<ESC><cmd> qa! <CR>", "quit all!" },
    -- page jump keep cursor in place
    ["<C-d>"] = { "<C-d>zz", "PgDn keep center" },
    ["<C-u>"] = { "<C-u>zz", "PgUp keep center" },
  },

  n = {
    -- Line nums, notif, wrap
    ["<leader>nl"] = { "<cmd> set nu! <CR>", "toggle line number" },
    ["<leader>nr"] = { "<cmd> set rnu! <CR>", "toggle relative number" },
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
    -- -- move defaults for hjkl
    -- ["k"] = {"n","repeat search fwd", opts = { } },
    -- ["K"] = {"N","repeat search bck", opts = { } },
    -- ["m"] = {"i","insert -> modify", opts = { } },
    -- ["M"] = {"I","from begin line", opts = { } },
    -- ["j"] = {"e","jump word end", opts = { } },
    -- ["J"] = {"E","jump word end", opts = { } },
    -- ["h"] = {"o","new line below", opts = { } },
    -- ["H"] = {"O","new line above", opts = { } },
    -- -- navigate within normal mode
    -- ["n"] = {"<Left>","move left", opts = {} },
    -- ["e"] = {"<Down>","move down", opts = {} },
    -- ["i"] = {"<Up>","move up", opts = {} },
    -- ["o"] = {"<Right>","move right", opts = {} },
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
    -- magma-nvim notebooks 
    -- ["<leader>r"] = { "<cmd> MagmaEvaluateOperator<CR>","Start magma", opts = { silent = true } },
    -- ["<Leader>rr"] = { "<cmd> MagmaEvaluateLine<CR>", opts = { silent = true } },
    -- ["<Leader>rc"] = { "<cmd> MagmaReevaluateCell<CR>", opts = { silent = true } },
    -- ["<Leader>rd"] = { "<cmd> MagmaDelete<CR>", opts = { silent = true } },
    -- ["<Leader>ro"] = { "<cmd> MagmaShowOutput<CR>", opts = { silent = true } },
    -- ["<Leader>rq"] = { "<cmd> MagmaEnterOutput<CR>", opts = { silent = true } },
  },

  v = {
    -- -- insert -> modify
    -- ["m"] = {"i","insert -> modify", opts = { } },
    -- ["M"] = {"I","from begin line", opts = { } },
    -- ["n"] = {"<Left>","move left", opts = {} },
    -- ["e"] = {"<Down>","move down", opts = {} },
    -- ["i"] = {"<Up>","move up", opts = {} },
    -- ["o"] = {"<Right>","move right", opts = {} },
  },

}

return M
