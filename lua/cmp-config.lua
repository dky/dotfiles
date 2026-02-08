local cmp = require'cmp'

local lsp_symbols = {
    Text = "   (Text) ",
    Method = "   (Method)",
    Function = "   (Function)",
    Constructor = "   (Constructor)",
    Field = " ﴲ  (Field)",
    Variable = "[] (Variable)",
    Class = "   (Class)",
    Interface = " ﰮ  (Interface)",
    Module = "   (Module)",
    Property = " 襁 (Property)",
    Unit = "   (Unit)",
    Value = "   (Value)",
    Enum = " 練 (Enum)",
    Keyword = "   (Keyword)",
    Snippet = "   (Snippet)",
    Copilot = "",
    Color = "   (Color)",
    File = "   (File)",
    Reference = "   (Reference)",
    Folder = "   (Folder)",
    EnumMember = "   (EnumMember)",
    Constant = " ﲀ  (Constant)",
    Struct = " ﳤ  (Struct)",
    Event = "   (Event)",
    Operator = "   (Operator)",
    TypeParameter = "   (TypeParameter)",
}

cmp.setup({
    sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "copilot", priority = 900 },
        { name = "vsnip", priority = 800 },
        { name = "path", priority = 700 },
        { name = "buffer", priority = 500, keyword_length = 3 },
        { name = "dictionary", priority = 400, keyword_length = 2 },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<s-tab>"] = cmp.mapping.select_prev_item(),
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

    },
    formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = ({
                copilot = "[Copilot]",
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                vsnip = "[Snippet]",
            })[entry.source.name]

            return item
        end,
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
})

-- '/' search completion
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})

-- ':' command completion
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
    )
})

-- markdown-specific dictionary completion
cmp.setup.filetype('markdown', {
    sources = cmp.config.sources(
        { { name = 'nvim_lsp' } },
        { { name = 'vsnip' } },
        { { name = 'buffer' } },
        { { name = 'dictionary', keyword_length = 2 } }
    )
})

require("copilot_cmp").setup()

require("cmp_dictionary").setup({
    paths = { "$HOME/.vim/dict/custom_dictionary.txt" },
    first_case_insensitive = true,
})
