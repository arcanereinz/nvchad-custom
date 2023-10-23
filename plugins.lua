local plugins = {
  -- http rest: see mappings.lua for setup details
  {
    "rest-nvim/rest.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("rest-nvim").setup({
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = true,
      })
    end
  },
  -- codelldb nvim plugin
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    }
  },
  -- js debugger ui
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  -- js debugger
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },
  -- C/C++ formatter and linter
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },
  -- prettier (2 second delay between activation on write)
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },
  -- eslint-lsp (5 second delay between activation on write)
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },
  -- os-level package manager
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp", -- linter
        "prettier", -- formatter
        "js-debug-adapter", -- JavaScript debugger
        "typescript-language-server", -- JavaScript/TypeScript LSP
        "clangd", -- C/C++ LSP
        "clang-format", -- C/C++ formatter
        "codelldb", -- clang debugger
      }
    }
  },
  -- plugin for lsp
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
