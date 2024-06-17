return {
    -- {
    --     "neovim/nvim-lspconfig",
    --     event = "LazyFile",
    --     dependencies = {
    --         { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    --         { "folke/neodev.nvim", opts = {} },
    --         "mason.nvim",
    --         "williamboman/mason-lspconfig.nvim",
    --     },
    --     config = function()
    --         local lspconfig = require("lspconfig")
    --         lspconfig.tsserver.setup({})
    --         -- lspconfig.lua_ls.setup({})
    --         lspconfig.phpactor.setup({})
    --     end,
    -- },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            -- import mason
            local mason = require("mason")

            -- import mason-lspconfig
            local mason_lspconfig = require("mason-lspconfig")

            local mason_tool_installer = require("mason-tool-installer")

            -- enable mason and configure icons
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            mason_lspconfig.setup({
                -- list of servers for mason to install
                ensure_installed = {
                    "tsserver",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "svelte",
                    "lua_ls",
                    "graphql",
                    "emmet_ls",
                    "prismals",
                    "pyright",
                    "twiggy_language_server",
                    "phpactor",
                },
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true, -- not the same as ensure_installed
            })

            mason_tool_installer.setup({
                ensure_installed = {
                    "prettier", -- prettier formatter
                    "stylua", -- lua formatter
                    -- "isort", -- python formatter
                    -- "black", -- python formatter
                    -- "pylint", -- python linter
                    "eslint_d", -- js linter
                },
            })
        end,
    },
    {
        -- icons next to suggestions
        "nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },
}
