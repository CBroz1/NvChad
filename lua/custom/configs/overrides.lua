local M = {}
local cmp = require("cmp")

M.cmp = {
  mapping = {
    ["<C-o>"] = cmp.mapping.complete(),
    ["<ESC>"] = cmp.mapping.close(),
    ["<C-e>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    -- ["<CR>"] = {}
  },
  sources = {
    { name = "copilot" },
    { name = "codeium", max_item_count = 3},
    { name = "cmp_tabnine" },
    { name = "luasnip" , max_item_count = 3},
    { name = "buffer", keyword_length = 3, max_item_count = 3},
    { name = "nvim_lsp" , max_item_count = 3},
    -- { name = "nvim_lua" },
    { name = "path" , max_item_count = 3},
    { name = "treesitter" , max_item_count = 3},
    -- { name = "nvim_lsp_signature_help" },
    -- { name = "nvim_lsp_document_symbol" },
    -- { name = "vim_lsp" },
  },
  }

return M
