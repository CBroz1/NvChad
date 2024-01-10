local overrides = require "custom.configs.overrides"
local cmp = require("cmp")

local plugins = {

  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = overrides.cmp,
  --   dependencies = {
  --     "hrsh7th/cmp-cmdline",
  --     "hrsh7th/cmp-emoji",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-nvim-lua",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-vsnip",
  --     "delphinus/cmp-ctags",
  --     "hrsh7th/cmp-nvim-lsp-document-symbol",
  --     -- "hrsh7th/cmp-copilot",
  --     "ray-x/cmp-treesitter",
  --     "hrsh7th/cmp-nvim-lsp-signature-help",
  --     { "jcdickinson/codeium.nvim", config = true },
  --     {
  --       "tzachar/cmp-tabnine",
  --       build = "./install.sh",
  --       config = function()
  --         local tabnine = require "cmp_tabnine.config"
  --         tabnine:setup {} -- put your options here
  --       end,
  --     },
  --   },
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "bash",
        "python",
        "regex",
        "markdown",
        "markdown_inline",
        "json"
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("treesitter-context").setup({
        max_lines = 10,
      })
    end,
  },
  -- In order to modify the `lspconfig` configuration:
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup({ require "custom.configs.noice" })
      require("noice").setup({lsp = {
        signature = { enabled = false },
        hover = { enabled = false }
      }})
      require("notify").setup({
        background_colour = "#282A36"
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
     "rcarriga/nvim-notify",
    }
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.neoscroll"
    end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    event = "BufReadPre",
    config = function()
      require "custom.configs.pretty-fold"
    end,
  },
  {
    -- surround chage motion
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    -- move by indentation level
    "jeetsukumaran/vim-indentwise",
    event = "VeryLazy",
  },
  {
    -- Change python environment 
    "AckslD/swenv.nvim",
    event = "VeryLazy"
  },
  {
    -- Add jumps to
    "ggandor/leap.nvim",
    event = "BufReadPre",
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    -- Python folding tools
    "tmhedberg/SimpylFold",
    event = "VeryLazy",
  },
  -- {
  --   -- Copilot
  --   "github/copilot.vim",
  --   event = "BufReadPre",
  -- },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    opts = function ()
      return require "custom.configs.copilot"
    end,
    config = function(_, opts)
      require("copilot").setup(opts)
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      M.mapping["<C-]>"] = cmp.mapping(function(_fallback)
        cmp.mapping.abort()
        require("copilot.suggestion").accept_line()
      end, {
          "i",
          "s",
        })
      -- M.sources = { max_item_count = 3 }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "ThePrimeagen/harpoon",
    event = "BufReadPre",
    config = function()
      require("harpoon").setup()
      require("telescope").load_extension('harpoon')
    end
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    event = "BufReadPre",
    config = function()
      require("git-worktree").setup()
      require("telescope").load_extension("git_worktree")
    end
  },
  {
    "taoso/tagbar-markdown", 
    event="VeryLazy",
    dependencies = {
      "majutsushi/tagbar",
    }
  }, 
  { 
    "richardbizik/nvim-toc",
    event="VeryLazy",
    config = function() 
      require("nvim-toc").setup({})
    end
  }
}

return plugins
