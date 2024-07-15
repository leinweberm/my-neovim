return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  config = function()
    require('todo-comments').setup()
  end,
}
