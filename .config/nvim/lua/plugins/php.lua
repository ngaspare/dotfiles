return {
  -- Import LazyVim PHP language pack
  { import = "lazyvim.plugins.extras.lang.php" },

  -- Override the default intelephense with phpactor
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable intelephense
        intelephense = false,
        -- Configure phpactor
        phpactor = {
          init_options = {
            ["language_server_phpstan.enabled"] = true,
            ["language_server_psalm.enabled"] = true,
            ["phpunit.enabled"] = true,
            ["composer.enabled"] = true,
          },
        },
      },
    },
  },

  -- Add Twig support for Pimcore templates
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "php_only", 
        "twig",
        "html",
        "css",
        "javascript",
        "sql",
        "yaml",
        "xml",
      })
    end,
  },

  -- PHP debugging with nvim-dap
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "php-debug-adapter")
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters.php then
        dap.adapters.php = {
          type = "executable",
          command = "node",
          args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
        }
      end
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          log = false,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
          },
        },
      }
    end,
  },

  -- PHP testing with neotest
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    opts = {
      adapters = {
        ["neotest-phpunit"] = {},
      },
    },
  },

  -- Enhanced PHP tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "phpactor",
        "php-cs-fixer",
        "phpstan",
        "psalm",
        "phpcbf",
        "phpcs",
      })
    end,
  },

  -- None-ls for PHP formatters and linters
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.phpcsfixer,
        nls.builtins.diagnostics.phpstan,
        nls.builtins.diagnostics.psalm,
        nls.builtins.diagnostics.phpcs.with({
          args = { "--standard=PSR12", "--report=json", "-s", "-" },
        }),
      })
    end,
  },

  -- Conform.nvim for PHP formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer" },
      },
      formatters = {
        php_cs_fixer = {
          command = "php-cs-fixer",
          args = { "fix", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },

  -- Enhanced PHP syntax and features
  {
    "phpactor/phpactor",
    build = "composer install --no-dev --optimize-autoloader",
    ft = "php",
    keys = {
      { "<leader>pm", "<cmd>PhpactorContextMenu<cr>", desc = "PHPActor Context Menu" },
      { "<leader>pn", "<cmd>PhpactorClassNew<cr>", desc = "PHPActor New Class" },
      { "<leader>pe", "<cmd>PhpactorExtractExpression<cr>", desc = "PHPActor Extract Expression", mode = "v" },
      { "<leader>pm", "<cmd>PhpactorExtractMethod<cr>", desc = "PHPActor Extract Method", mode = "v" },
      { "<leader>pf", "<cmd>PhpactorImportClass<cr>", desc = "PHPActor Import Class" },
      { "<leader>pt", "<cmd>PhpactorTransform<cr>", desc = "PHPActor Transform" },
    },
  },

  -- Additional Pimcore/Symfony related support
  {
    "yaegassy/coc-symfony",
    enabled = false, -- We're using native LSP, not CoC
  },

  -- Better PHP syntax highlighting
  {
    "StanAngeloff/php.vim",
    ft = "php",
  },
}