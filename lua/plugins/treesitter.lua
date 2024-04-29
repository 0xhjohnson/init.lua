return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_installed = {
            "bash",
            "css",
            "dockerfile",
            "go",
            "html",
            "javascript",
            "json",
            "latex",
            "lua",
            "markdown",
            "markdown_inline",
            "rust",
            "sql",
            "tsx",
            "typescript",
            "yaml",
        },
        sync_install = false
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
