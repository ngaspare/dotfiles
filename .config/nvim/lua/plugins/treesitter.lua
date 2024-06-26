return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "lua",
            "javascript",
            "typescript",
            "html",
            "css",
            "php",
            "tsx",
            "vimdoc",
            "json",
        },
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
        },
    },
}
