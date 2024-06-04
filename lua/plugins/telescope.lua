require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    path_display = {"smart"},
    file_ignore_patterns = {},
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
        preview_width = 0.5,
      },
      vertical = {
        mirror = false,
      },
      width = 0.75,
      height = 0.85,
      preview_cutoff = 120,
    },
    sorting_strategy = "ascending",
    winblend = 0,
    border = {},
    borderchars = {'-', '|', '-', '|', '+', '+', '+', '+'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    path_display = {"truncate"},
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker
  }
}
