return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        local Config = require("lazyvim.config")
        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

        for name, sign in pairs(Config.icons.dap) do
            sign = type(sign) == "table" and sign or { sign }
            vim.fn.sign_define(
                "Dap" .. name,
                { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
            )
        end

        dap.adapters.php = {
            type = "executable",
            command = "node",
            -- args = { "/home/nikola/vscode-php-debug/out/phpDebug.js" },
            args = {
                vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
            },
        }

        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for Xdebug",
                port = 9003,
            },
            {
                type = "php",
                request = "launch",
                name = "Docker debug (/var/www/html)",
                port = 9003,
                pathMappings = {
                    ["/var/www/html"] = "${workspaceFolder}",
                },
            },
            {
                name = "Run current script",
                type = "php",
                request = "launch",
                port = 9003,
                cwd = "${fileDirname}",
                program = "${file}",
                runtimeExecutable = "php",
            },
        }
    end,
    --     local dap = require("dap")
    --
    --     dap.adapters.php = {
    --   type = 'executable',
    --   command = 'node',
    --   args = { '/path/to/vscode-php-debug/out/phpDebug.js' }
    -- }
    --
    -- dap.configurations.php = {
    --   {
    --     type = 'php',
    --     request = 'launch',
    --     name = 'Listen for Xdebug',
    --     port = 9000
    --   }
    -- }
    -- config = function()
    --     local dap = require("dap")
    --
    --     dap.adapters.php = {
    --         type = "executable",
    --         command = "node",
    --         args = { "/home/nikola/vscode-php-debug/out/phpDebug.js" },
    --     }
    --
    --     dap.configurations.php = {
    --         {
    --             type = "php",
    --             request = "launch",
    --             name = "Listen for Xdebug",
    --             port = 9003,
    --         },
    --     }
    -- end,

    -- dependencies = {
    --     "rcarriga/nvim-dap-ui",
    -- },
    -- config = function()
    --     local dap = require("dap")
    --     local dapui = require("dapui")
    --
    --     require("dapui")
    --
    --     dap.listeners.before.attach.dapui_config = function()
    --         dapui.open()
    --     end
    --     dap.listeners.before.launch.dapui_config = function()
    --         dapui.open()
    --     end
    --     dap.listeners.before.event_terminated.dapui_config = function()
    --         dapui.close()
    --     end
    --     dap.listeners.before.event_exited.dapui_config = function()
    --         dapui.close()
    --     end
    --
    --     -- vim.keymap.set("n", "<F9>", dap.continue, opts)
    --     -- vim.keymap.set("n", "<F8>", dap.step_over, opts)
    --     -- vim.keymap.set("n", "<F7>", dap.step_into, opts)
    --     -- vim.keymap.set("n", "<F12>", dap.step_out, opts)
    --     -- vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
    --
    --     dap.adapters.php = {
    --         type = "executable",
    --         command = "node",
    --         args = { "/home/nikola/vscode-php-debug/out/phpDebug.js" },
    --     }
    --
    --     dap.configurations.php = {
    --         {
    --             type = "php",
    --             request = "launch",
    --             name = "Listen for Xdebug",
    --             port = 9003,
    --         },
    --     }
    -- end,
}
