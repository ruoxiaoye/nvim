-- 快捷键映射
-- 设置leader key为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 保存本地变量
local map = vim.api.nvim_set_keymap
-- 复用opt参数
local opt = {noremap = true, silent = true }

-- 取消 s 默认功能
map("n", "s","",opt)
-- windows 分屏快捷键
map("n","sv",":vsp<CR>",opt)
map("n","sh",":sp<CR>",opt)
-- 关闭当前
map("n","sc","<C-W>c",opt)
-- 关闭其它
map("n","so","<C-W>o",opt)
-- Alt+hjkl窗口之间切换
map("n","<A-h>","<C-W>h",opt)
map("n","<A-j>","<C-W>j",opt)
map("n","<A-k>","<C-W>k",opt)
map("n","<A-l>","<C-W>l",opt)

-- 插件快捷键
local pluginKeys = {}
-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
-- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys
