return {
    'L3MON4D3/LuaSnip',
    keys = function()
        local luasnip = require 'luasnip'
        local expand = function() luasnip.expand() end
        local jump = function(n)
            return function() luasnip.jump(n) end
        end

        return {
            { '<C-space>', mode = 'i',          expand },
            { '<C-n>',     mode = { 'i', 's' }, jump(1) },
            { '<C-p>',     mode = { 'i', 's' }, jump(-1) },
        }
    end,
    config = function()
        local luasnip = require 'luasnip'
        luasnip.config.setup { update_events = 'TextChanged,TextChangedI' }

        local rep = require('luasnip.extras').rep
        local fmt = require('luasnip.extras.fmt').fmt
        local fmta = require('luasnip.extras.fmt').fmta

        local t = luasnip.text_node
        local i = luasnip.insert_node
        local snippet = luasnip.snippet

        luasnip.add_snippets('cpp', {
            snippet('cpt', fmta(
                [[
                    <include>
                    using namespace std;

                    int main() {
                        ios_base::sync_with_stdio(false);
                        cin.tie(NULL);
                        <start>
                        return 0;
                    }
                ]], { start = i(1, ':'), include = t('#include <bits/stdc++.h>') }
            )),

            snippet('fa', { t('for(auto &a: A) cin >> a;') }),

            snippet('fr', fmt(
                [[
                    for(int i = 0; i < {n}; ++i) {{
                        {scope}
                    }}
                ]], { n = i(1, '_'), scope = i(0, ':') }
            )),

            snippet('fn', fmta(
                [[
                    <T> <fn>() {
                        <body>
                    }
                ]], { T = i(1, 'T'), fn = i(2, '_'), body = i(0, ':') }
            )),

            snippet('?', fmta(
                [[
                    <cond> ? <yes> : <no>
                ]], { cond = i(1, '_'), yes = i(2, '_'), no = i(3, '_') }
            )),

            snippet('in2', fmt(
                [[
                    {type} {}, {}; cin >> {} >> {};
                ]], { type = i(1, 'T'), i(2, 'A'), i(3, 'B'), rep(2, 'A'), rep(3, 'B') }
            )),
        })
    end
}