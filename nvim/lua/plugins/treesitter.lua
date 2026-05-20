return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "python",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "json",
                "yaml",
                "go",
                "zig",
                "rust",
                "markdown",
                "markdown_inline",
            },
            auto_install = true,
        })
    end,
}
