return {
  init = function(use)
    use {
      'folke/todo-comments.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope.nvim'},
        {'folke/trouble.nvim'},
      },
      config = function()
        require'todo-comments'.setup()
      end,
    }
  end,
}
