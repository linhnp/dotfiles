local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --['<Tab>'] = cmp.mapping(function(fallback)
    --  local col = vim.fn.col('.') - 1

    --  if cmp.visible() then
    --    cmp.select_next_item(select_opts)
    --  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    --    fallback()
    --  else
    --    cmp.complete()
    --  end
    --end, {'i', 's'}),
    ---- end <Tab>

    --['<S-Tab>'] = cmp.mapping(function(fallback)
    --  if cmp.visible() then
    --    cmp.select_prev_item(select_opts)
    --  else
    --    fallback()
    --  end
    --end, {'i', 's'}),
    -- end <S-Tab>
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users
      { name = 'buffer' },
      { name = 'path' }
  })
})
-- end cmd general setup

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "lua_ls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

vim.keymap.set("i", "<tab>", function() if vim.fn.call("vsnip#jumpable", {1}) == 1 then return "<Plug>(vsnip-jump-next)" else return "<tab>" end end, {expr=true, silent=true})
vim.keymap.set("s", "<tab>", function() if vim.fn.call("vsnip#jumpable", {1}) == 1 then return "<Plug>(vsnip-jump-next)" else return "<tab>" end end, {expr=true, silent=true})
vim.keymap.set("i", "<s-tab>", function() if vim.fn.call("vsnip#jumpable", {-1}) == 1 then return "<Plug>(vsnip-jump-prev)" else return "<s-tab>" end end, {expr=true, silent=true})
vim.keymap.set("s", "<s-tab>", function() if vim.fn.call("vsnip#jumpable", {-1}) == 1 then return "<Plug>(vsnip-jump-prev)" else return "<s-tab>" end end, {expr=true, silent=true})