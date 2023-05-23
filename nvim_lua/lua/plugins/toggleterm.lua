return {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = true,
      opts = {
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        direction = 'float',
        close_on_exit = true,
        insert_mappings = true,
        terminal_mappings = true,
      }
}
