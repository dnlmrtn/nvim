require("nvim-tree").setup({
  git = {
    enable = true
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    hightlight_git = true,
  },
  filters = {
    dotfiles = false,
  },
})
