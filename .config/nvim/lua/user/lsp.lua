-- Native LSP Setup
local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {"pyright","gopls","rls","sumneko_lua","ccls","tsserver"}
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n","<leader>lr","<cmd>Telescope lsp_references<cr>")
map("n","<leader>ls","<cmd>Telescope lsp_document_symbols<cr>")
map("n","<leader>lS","<cmd>Telescope lsp_workspace_symbols<cr>")
map("n","<leader>ld","<cmd>Telescope diagnostics bufnr=0<cr>")

for _,lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{
      single_file_support = true,
      capabilities = capabilities,
      on_attach = function() 
        map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
        map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
        map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
        map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
        map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
        map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
        map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
        map('n','<leader>la','<cmd>lua vim.lsp.buf.code_action()<CR>')
        map('n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>')
        map('n','<C-p>', '<cmd>lua vim.lsp.buf.formatting()<CR>')
      end
    }
end
-- Turn off inline buffer diagnostics
vim.diagnostic.config({virtual_text = false})

-- LSP autocomplete
vim.opt.completeopt={"menu", "menuone", "noselect"} -- setting vim values
-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    " ?  (Text) ",
    " ?  (Method)",
    " ?  (Function)",
    " ?  (Constructor)",
    " ?  (Field)",
    "[?] (Variable)",
    " ?  (Class)",
    " ?  (Interface)",
    " ?  (Module)",
    " ? (Property)",
    " ?  (Unit)",
    " ?  (Value)",
    " ? (Enum)",
    " ?  (Keyword)",
    " ?  (Snippet)",
    " ?  (Color)",
    " ?  (File)",
    " ?  (Reference)",
    " ?  (Folder)",
    " ?  (EnumMember)",
    " ?  (Constant)",
    " ?  (Struct)",
    " ?  (Event)",
    " ?  (Operator)",
    " ?  (TypeParameter)"
}

-- luasnip and nvim-cmp
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require'cmp'

require("luasnip.loaders.from_snipmate").load()

cmp.setup({
snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
},
mapping = {
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' }, -- For luasnip users.
}, {
  { name = 'buffer' },
})
})
