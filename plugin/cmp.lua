
local cmp =require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

    formatting = {
    	format = function(entry,vim_item)
			vim_item.menu = ({
				-- luasnip = "[Snippet]",
 				buffer = "[Buffer]",
 				nvim_lsp = "[LSP]",
 				nvim_lua = "[API]",
 				path = "[Path]",
 				cmd_line = "[CMD]",
 				gh_isusses = "[Isusses]",
 			})[entry.source.name]

		return vim_item
	end
    },
    window = {
    --   completion = cmp.config.window.bordered(),
    --   documentation = cmp.config.window.bordered(),
    }

 ,
    mapping = cmp.mapping.preset.insert({

      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<C-y>"] = cmp.mapping.confirm({
	      behavior = cmp.ConfirmBehavior.Insert,
	 	select = true
 	  }),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
    }),
    sources = cmp.config.sources({

 		{ name = "gh_issues" },
 		{ name = "nvim_lua"},
 		{ name = "nvim_lsp" },
 		{ name = "path"},
 		{ name = "luasnip" },
 		{ name = "cmd_line"},
 		{ name = "buffer", keyword_length = 5 },
      --{ name = 'vsnip' }, -- For vsnip users.
--       { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
   --  }, {
    --  { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
      -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      		{ name = "cmd_line" },
	        { name = 'buffer' }
      }
    })
 -- })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pylsp'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['intelephense'].setup {
     capabilities = capabilities
     --require('intelephense').default_capabilities() 
  }
  require('lspconfig')['tsserver'].setup{
    capabilities = capabilities	
  }

  require('lspconfig')['bashls'].setup{
    capabilities = capabilities

}

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig')['html'].setup {
  capabilities = capabilities,
}

require('lspconfig')['emmet_ls'].setup({
 capabilities =capabilities,
})

-- local css_capabilites =  vim.lsp.protocol.make_client_capabilities()
-- css_capabilites.textDocument.completion.completionItem.snippetSupport = true

-- require'lspconfig'.cssls.setup {
--  capabilities = css_capabilites
--}
-- cmp.setup({
-- 	mapping = {
-- 	  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 	  ["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 	  ["<C-e>"] = cmp.mapping.close(),
-- 	  ["<C-y>"] = cmp.mapping.confirm({
-- 		behavior = cmp.ConfirmBehavior.Insert,
-- 		select = true
-- 	  }),
-- 		
-- 	  ["<C-space>"] = cmp.mapping.complete(),
-- 	},
-- 	sources = {
-- 		{ name = "gh_issues" },
-- 		{ name = "nvim_lua"},
-- 		{ name = "nvim_lsp" },
-- 		{ name = "path"},
-- 		{ name = "luasnip" },
-- 		{ name = "cmd_line"},
-- 		{ name = "buffer", keyword_length = 5 },
-- 	},
-- 	snippet = {
-- 		expend = function(args)
-- 			require("luasnip").lsp_expand(args.body)
-- 		end
-- 	},
-- 	formatting = lspkind.cmp_format({
-- 		format = {
-- 			with_text = true,
-- 			menu = {
-- 				buffer = "[Buffer]",
-- 				nvim_lsp = "[LSP]",
-- 				nvim_lua = "[API]",
-- 				path = "[Path]",
-- 				cmd_line = "[CMD]",
-- 				gh_isusses = "[Isusses]",
-- 				luasnip = "[Snippet]"
-- 			}
-- 		} 
-- 	})
--})
