return {
  init = function(use)
      use {
        'ggandor/lightspeed.nvim',
        config = function()
          require'lightspeed'.setup {
            ignore_case = true,
          }
        end,
      }
  end,
}
