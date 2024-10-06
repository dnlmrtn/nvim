-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  -- Snippet support
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Enables `luasnip` integration for expanding snippets
    end,
  },
  -- Key mappings for nvim-cmp
  mapping = {
    -- Scroll documentation up in the completion menu with Ctrl-b
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    
    -- Scroll documentation down in the completion menu with Ctrl-f
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    
    -- Trigger completion menu manually with Ctrl-Space
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    
    -- Abort completion with Ctrl-e in insert mode, or close menu in command-line mode
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),  -- For insert mode
      c = cmp.mapping.close(),  -- For command-line mode
    }),
 
    -- Confirm the selected completion item with Enter
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirms selection; `select = true` means auto-select if no manual choice

    -- Tab key behavior
    ['<Tab>'] = cmp.mapping(function(fallback)
      -- If the completion menu is visible, select the next item
      if cmp.visible() then
        cmp.select_next_item()
      -- If a `luasnip` snippet is expandable or jumpable, expand or jump
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      -- Fallback to default tab behavior if no completion or snippet action is available
      else
        fallback()
      end
    end, { 'i', 's' }), -- Available in both insert ('i') and select ('s') modes

    -- Shift-Tab behavior for selecting previous items
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      -- If the completion menu is visible, select the previous item
      if cmp.visible() then
        cmp.select_prev_item()
      -- If in `luasnip`, jump backwards through the snippet
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      -- Fallback to default Shift-Tab behavior if no completion or snippet action is available
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  -- Completion sources (in priority order)
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP completion source
    { name = 'luasnip' },   -- Snippet completion source
  }, {
    { name = 'buffer' },    -- Buffer word completion source
  })
})

