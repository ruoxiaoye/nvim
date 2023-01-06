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
