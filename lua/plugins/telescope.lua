return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local actions = require "telescope.actions"
        require("telescope").setup {
            defaults = {
                mappings = {
                    ["i"] = {
                        ["<Esc>"] = actions.close,
                        ["<Tab>"] = actions.toggle_selection
                    }
                },
                layout_config = {
                    prompt_position = "top"
                }
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true
                }
            }
        }

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", ":Telescope file_browser path=%:p:h grouped=true select_buffer=true<CR>")
        vim.keymap.set("n", "<leader>fb", builtin.buffers)

        require("telescope").load_extension "file_browser"
    end
}
