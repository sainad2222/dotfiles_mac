-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function DiffSplit()
    local opts = {
        attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
                -- filename is available at entry[1]
                local entry = require("telescope.actions.state").get_selected_entry()
                require("telescope.actions").close(prompt_bufnr)
                local filename = entry[1]
                -- Insert filename in current cursor position
                vim.cmd(':diffsplit ' .. filename)
            end)
            return true
        end,
    }
    require("telescope.builtin").find_files(opts)
end

map("n","<C-b>",":Telescope file_browser<CR>")
map("n","<leader>ff",":Telescope find_files<CR>")
map("n","<leader>fg",":Telescope live_grep<CR>")

vim.cmd[[
    command! -nargs=* Diffsplit :lua DiffSplit()
]]

require("telescope").setup{
    extensions = {
        file_browser = {
          theme = "ivy",
        },
      },
}
require("telescope").load_extension("file_browser")
