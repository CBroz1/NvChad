-- custom/configs/null-ls.lua

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local sources = {
  -- formatting.prettier,
  formatting.black.with({ 
    extra_args = { "--config", vim.fn.expand("~/.config/black") } 
  }),
  formatting.isort.with({ extra_args = { "--profile", "black" } }),
  -- formatting.autopep8,
  formatting.markdownlint.with({
    extra_args = { "--config", vim.fn.expand("~/.config/.markdownlint.yaml") },
  }),
  -- formatting.prettier,

  lint.shellcheck,
  lint.cspell.with({ extra_args = { "--config", vim.fn.expand("~/.config/.cspell.json") } }),
  lint.markdownlint.with({
    extra_args = { "--config", vim.fn.expand("~/.config/.markdownlint.yaml") },
  }),
  -- lint.pydocstyle,
  -- lint.flake8.with({ extra_args = { "--max-line-length=80" } }),
  -- lint.pylint.with({ extra_args = { 
  --   "--max-line-length=80",  
  --   "--load-plugins=datajoint_linter",
  --   "--disable=missing-docstring,invalid-name,import-error,too-many-arguments,too-many-locals,too-many-branches,too-many-statements,too-many-instance-attributes,too-many-public-methods,too-few-public-methods,too-many-lines,too-many-function-args,too-many-nested-blocks,too-many-return-statements,too-many-boolean-expressions,too-many-ancestors,too-many-boolean-expressions,too-many-arguments,too-many-locals,too-many-branches,too-many-statements,too-many-instance-attributes,too-many-public-methods,too-few-public-methods,too-many-lines,too-many-function-args,too-many-nested-blocks,too-many-return-statements,too-many-boolean-expressions,too-many-ancestors,too-many-boolean-expressions,too-many-arguments,too-many-locals,too-many-branches,too-many-statements,too-many-instance-attributes,too-many-public-methods,too-few-public-methods,too-many-lines,too-many-function-args,too-many-nested-blocks,too-many-return-statements,too-many-boolean-expressions,too-many-ancestors"
  -- } }),
  -- lint.mypy,
  -- lint.pycodestyle,

  completion.spell,
  completion.luasnip
}

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
}
