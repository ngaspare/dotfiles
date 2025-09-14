return {
  -- Pimcore specific file associations and patterns
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add file associations for Pimcore
      vim.filetype.add({
        extension = {
          twig = "twig",
        },
        pattern = {
          [".*%.html%.twig"] = "twig",
          [".*%.xml%.twig"] = "twig",
          [".*%.js%.twig"] = "twig",
          [".*%.css%.twig"] = "twig",
        },
      })
    end,
  },

  -- Enhanced telescope for Pimcore projects
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Search in Pimcore specific directories
      {
        "<leader>pt",
        function()
          require("telescope.builtin").find_files({
            search_dirs = { "./templates", "./src/Resources/views" },
            prompt_title = "Pimcore Templates",
          })
        end,
        desc = "Find Pimcore Templates",
      },
      {
        "<leader>pc",
        function()
          require("telescope.builtin").find_files({
            search_dirs = { "./src/Controller", "./src/Command" },
            prompt_title = "Pimcore Controllers & Commands",
          })
        end,
        desc = "Find Pimcore Controllers",
      },
      {
        "<leader>pe",
        function()
          require("telescope.builtin").find_files({
            search_dirs = { "./src/Entity", "./src/Model" },
            prompt_title = "Pimcore Entities & Models",
          })
        end,
        desc = "Find Pimcore Entities",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").find_files({
            search_dirs = { "./src/Service", "./src/EventListener" },
            prompt_title = "Pimcore Services & Listeners",
          })
        end,
        desc = "Find Pimcore Services",
      },
    },
  },

  -- Symfony/Pimcore console commands
  {
    "phpactor/phpactor",
    keys = {
      {
        "<leader>cc",
        function()
          local input = vim.fn.input("Console command: bin/console ")
          if input ~= "" then
            vim.cmd("split | terminal bin/console " .. input)
          end
        end,
        desc = "Run Pimcore Console Command",
      },
      {
        "<leader>ccc",
        "<cmd>split | terminal bin/console cache:clear<cr>",
        desc = "Clear Pimcore Cache",
      },
    },
  },

  -- Docker support for Pimcore (if using Docker)
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>dc",
        function()
          local input = vim.fn.input("Docker compose command: docker-compose ")
          if input ~= "" then
            vim.cmd("split | terminal docker-compose " .. input)
          end
        end,
        desc = "Run Docker Compose Command",
      },
    },
  },

  -- Auto-detect Pimcore projects and set up accordingly
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      -- Auto-detect if we're in a Pimcore project
      local function is_pimcore_project()
        return vim.fn.filereadable("pimcore/composer.json") == 1 
          or vim.fn.filereadable("composer.json") == 1 and vim.fn.search("pimcore/pimcore", "n") > 0
      end

      -- Set up Pimcore-specific LSP settings
      if is_pimcore_project() then
        opts.servers = opts.servers or {}
        if opts.servers.phpactor then
          opts.servers.phpactor.init_options = vim.tbl_deep_extend("force", 
            opts.servers.phpactor.init_options or {}, {
              ["symfony.enabled"] = true,
              ["doctrine.enabled"] = true,
              ["twig.enabled"] = true,
            })
        end
      end
    end,
  },
}