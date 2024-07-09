return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fh",
      function()
        require("telescope.builtin").find_files({
          no_ignore = true,
          hidden = true,
        })
      end,
      desc = "Find all files",
    },
    {
      "<leader>sv",
      function()
        require("telescope.builtin").live_grep({
          search_dirs = { "./vendor" },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-u",
          },
        })
      end,
      desc = "Search all",
    },
  },
}
