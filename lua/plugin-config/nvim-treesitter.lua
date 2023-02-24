-- treesitter 语法高亮模块
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
  return
end

-- 自动安装语言 及开启高亮显示
treesitter.setup({
  -- 安装language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"vim","lua","c","cmake","make","markdown"},
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  -- 代码缩进模块 （=）
  indent = {
    enable = true,
  },
})

-- 代码折叠模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow,com/questions/
vim.opt.foldlevel = 99
