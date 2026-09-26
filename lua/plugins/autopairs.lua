return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require('nvim-autopairs')
    local rule = require('nvim-autopairs.rule')

    npairs.setup()

    -- Custom rules
    npairs.add_rules({
      rule("$", "$", "typst")
    })
  end
}
