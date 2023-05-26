local M = {}

M.disabled = {
  i = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-n>"] = "",
    ["<C-e>"] = "",
    ["<C-i>"] = "",
    ["<C-o>"] = "",
  },

  n = {
    ["<C-f>"] = "",
    ["k"] = "",
    ["K"] = "",
    ["m"] = "",
    ["M"] = "" ,
    ["n"] = "",
    ["e"] = "",
    ["i"] = "",
    ["o"] = "",
    ["<C-n>"] = "",
    ["<C-e>"] = "",
    ["<C-i>"] = "",
    ["<C-o>"] = "",
  },
}

M.custom = {
  i = {
    -- go to  beginning and end
    ["<C-h>"] = { "<ESC>^i", "beginning of line" },
    ["<C-l>"] = { "<End>", "end of line" },

    -- navigate within insert mode
    ["<C-n>"] = { "<Left>", "move left" },
    ["<C-e>"] = { "<Down>", "move down" },
    ["<C-i>"] = { "<Up>", "move up" },
    ["<C-o>"] = { "<Right>", "move right" },
  },

  n = {
    -- toggle tree
    ["<C-f>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    -- move defaults
    ["k"] = {"n","repeat search fwd", opts = { } },
    ["K"] = {"N","repeat search bck", opts = { } },
    ["m"] = {"i","insert -> modify", opts = { } },
    ["M"] = {"I","from begin line", opts = { } },
    ["j"] = {"e","jump word end", opts = { } },
    ["J"] = {"E","jump word end", opts = { } },

    -- navigate within normal mode
    ["n"] = {"<Left>","move left", opts = {} },
    ["e"] = {"<Down>","move down", opts = {} },
    ["i"] = {"<Up>","move up", opts = {} },
    ["o"] = {"<Right>","move right", opts = {} },
    -- switch between windows
    ["<C-n>"] = { "<C-w>h", "window left" },
    ["<C-e>"] = { "<C-w>j", "window down" },
    ["<C-i>"] = { "<C-w>k", "window up" },
    ["<C-o>"] = { "<C-w>l", "window right" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    -- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
    -- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
  },

  v = {
    
    ["n"] = {"j", opts = { noremap = true} },
    ["e"] = {"k", opts = { noremap = true} },
    ["i"] = {"l", opts = { noremap = true} },
  --   ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
  --   ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
  },

  -- x = {
  --   ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
  --   ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
  --   -- Don't copy the replaced text after pasting in visual mode
  --   -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
  -- },= true,

}
return M
