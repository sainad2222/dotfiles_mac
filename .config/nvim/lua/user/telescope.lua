-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n","<C-b>",":Telescope file_browser<CR>")
map("n","<leader>ff",":Telescope find_files<CR>")
map("n","<leader>fg",":Telescope live_grep<CR>")

require("telescope").setup{
    extensions = {
        file_browser = {
          theme = "ivy",
        },
      },
}
require("telescope").load_extension("file_browser")
