return {
    'windwp/nvim-autopairs',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require'cmp'

        -- auto-pairs for cmp
        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )
    end
}
