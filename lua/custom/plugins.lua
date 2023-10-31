local overrides = require "custom.configs.overrides"

local plugins = {

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      -- "hrsh7th/cmp-calc",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "delphinus/cmp-ctags",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-copilot",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      { "jcdickinson/codeium.nvim", config = true },
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {} -- put your options here
        end,
      },
    },
  },
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
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require "custom.configs.null-ls"
  --   end
  -- },
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
     -- "rcarriga/nvim-notify",
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
  -- {
  --   -- git interface 
  --   "tpope/vim-fugitive",
  --   event = "VeryLazy",
  -- },
  -- {
  --   -- Undo tree
  --   "mbbill/undotree",
  --   event = "BufReadPre",
  -- },
  {
    -- move by indentation level
    "jeetsukumaran/vim-indentwise",
    event = "VeryLazy",
  },
  {
    -- outline view
    "preservim/tagbar",
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
  {
    -- Copilot
    "github/copilot.vim",
    event = "BufReadPre",
  } -- {
  --   "dccsillag/magma-nvim",
  --   -- event = "BufReadPost",
  --   ft = "json",
  --   cmd = "UpdateRemotePlugins",
  --   lazy = false,
  -- }
}

return plugins
