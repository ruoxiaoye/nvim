-- 基础配置
require('basic')
-- 快捷键配置
require('keybindings')
-- 插件配置
require('plugins')
-- 主题设置
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
--require("plugin-config.dashboard")
require("plugin-config.nvim-treesitter")

-- LSP
require("lsp.setup")
require("lsp.cmp")

