return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter").setup {
            ensure_installed = {"c", "cpp", "cmake", "lua"}
        }
    end
}

--local function bah()
--end
