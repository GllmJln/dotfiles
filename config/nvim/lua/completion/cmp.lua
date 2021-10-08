local cmp = require('cmp')

cmp.setup {

    formatting = {
        format = function(entry, vim_item)
            -- set a name for each source
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                ultisnips = "[UltiSnips]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LTX]",
                look = "[Look]",
                path = "[Path]",
                spell = "[Spell]",
                calc = "[Calc]",
                emoji = "[Emoji]"
            })[entry.source.name]
            return vim_item
        end
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    snippet = {expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end},
    sources = {
        {name = "nvim_lsp"}, {name = "buffer"}, {name = "ultisnips"},
        {name = "nvim_lua"}, {name = "look"}, {name = "path"},
        {name = "emoji"}, {name = "latex_symbols"}, {name = "spell"}
    },
    completion = {completeopt = 'menu,menuone,noinsert'}
}

-- Autopairs
require("nvim-autopairs.completion.cmp").setup({
    map_cr = false,
    map_complete = true,
    auto_select = true
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
