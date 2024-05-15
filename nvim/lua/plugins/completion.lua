return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        require("luasnip.loaders.from_vscode").lazy_load { exclude = { 'rust', 'sql', 'yaml', 'dockerfile' } }
        luasnip.config.setup { update_events = 'TextChanged,TextChangedI' }

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {

                ['<C-Space>'] = cmp.mapping.confirm { select = true },

                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },

                ['<C-n>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<C-p>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

            },

            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:VisualNC,FloatBorder:VisualNC,CursorLine:PmenuSel"
                }),
                documentation = cmp.config.window.bordered(),
            },

            sources = {
                { name = 'nvim_lsp', max_item_count = 8 },
                { name = 'luasnip',  max_item_count = 8 },
                { name = 'buffer',   max_item_count = 5 },
                { name = 'path',     max_item_count = 5 },
                { name = 'calc',     max_item_count = 5 },
            },

        }

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    { name = 'path' }
                },
                {
                    { name = 'cmdline' }
                }
            ),
            ---@diagnostic disable-next-line: missing-fields
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end,
}
