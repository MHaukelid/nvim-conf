local cmp = require("cmp")
local cmp_format = require("lsp-zero").cmp_format({details = true})

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
		{ name = "buffer" }
  },

	formatting = cmp_format,

  mapping = {
    ["<Tab>"] = cmp.mapping.confirm({ select = false }),
    ["<Esc>"] = cmp.mapping.abort(),
    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
    ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
  },
  
	snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})
