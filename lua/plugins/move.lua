return {
    "fedepujol/move.nvim",
    config = function()
        vim.keymap.set("n", "<A-DOWN>", ":MoveLine(1)<CR>", opts)    
        vim.keymap.set("n", "<A-UP>", ":MoveLine(-1)<CR>", opts)
        vim.keymap.set("v", "<A-DOWN>", ":MoveBlock(1)<CR>", opts)
        vim.keymap.set("v", "<A-UP>", ":MoveBlock(-1)<CR>", opts)
    end
}
