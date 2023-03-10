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
-- 左右比例控制
map("n","<c-Left>",":vertical resize -2<CR>",opt)
map("n","<c-Right>",":vertical resize +2<CR>",opt)
map("n","s,",":vertical resize -20<CR>",opt)
map("n","s.",":vertical resize +20<CR>",opt)
-- 上下比例控制
map("n","sj",":resize +10<CR>",opt)
map("n","sk",":resize -10<CR>",opt)
map("n","<c-Down>",":resize +2<CR>",opt)
map("n","<c-UP>",":resize -2<CR>",opt)
-- 等比例
map("n","s=","<C-W>=",opt)
-- 上下滚动浏览
map("n", "<C-j>","5j",opt)
map("n", "<C-k>","5k",opt)
map("n", "<C-h>","5h",opt)
map("n", "<C-l>","5l",opt)
-- ctrl+u/ctrl+d 只移动9行 默认移动半屏
map("n", "<C-u>","9k",opt)
map("n", "<C-d>","9j",opt)
-- 退出
map("n", "qq",":q<CR>",opt)
map("n", "qqq",":q!<CR>",opt)
map("n", "Q",":qa!<CR>",opt)

-- visaul 模式下缩进代码
map("v","<","<gv",opt)
map("v",">",">gv",opt)
-- 在visual 模式里粘贴不要复制
map("v", "p","_dp",opt)
-- 上下移动选中文本
map("v","J",":move '>+1<CR>gv-gv",opt)
map("v","K",":move '<-2<CR>gv-gv",opt)

-- insert模式下，跳到行首行尾
map("i", "<C-h>","<ESC>I",opt)
map("i", "<C-l>","<ESC>A",opt)

-- terminal相关
map("n","<leader>t",":sp | terminal<CR>",opt)
map("n","<leader>vt",":vsp | terminal<CR>",opt)
map("t","<Esc>","<C-\\><C-n>",opt)
map("t","<A-h>",[[ <C-\><C-N><C-W>h ]],opt)
map("t","<A-j>",[[ <C-\><C-N><C-W>j ]],opt)
map("t","<A-k>",[[ <C-\><C-N><C-W>k ]],opt)
map("t","<A-l>",[[ <C-\><C-N><C-W>l ]],opt)

-- 插件快捷键
local pluginKeys = {}
-- nvim-treesitter 代码折叠
map("n", "zz", ":foldclose<CR>", opt)
map("n", "Z", ":foldopen<CR>", opt)
-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
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
-- bufferline
-- 左右tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
-- Telescope 模糊文件搜索
-- 查找文件
map("n","<C-p>",":Telescope find_files<CR>",opt)
-- 全局搜索
map("n","<C-f>",":Telescope live_grep<CR>",opt)
-- telescope 列表中 插入模式快捷键
pluginKeys.telescopelist = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动给
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}
------------------------LSP 快捷键---------------------------------------------
-- LSP回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n","<leader>rn","<cmd>lua vim.lsp.buf.rename()<CR>",opt)
  -- code action
  mapbuf("n","<leader>ca","<cmd>lua vim.lsp.buf.code_action()<CR>",opt)
  -- go xxx
  --mapbuf("n","gd","<cmd>lua vim.lsp.buf.definition()<CR>",opt)
  mapbuf("n","gd","<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
  mapbuf("n","gh","<cmd>lua vim.lsp.buf.hover()<CR>",opt)
  --mapbuf("n","gD","<cmd>lua vim.lsp.buf.declaration()<CR>",opt)
  --mapbuf("n","gi","<cmd>lua vim.lsp.buf.implementation()<CR>",opt)
  --mapbuf("n","gr","<cmd>lua vim.lsp.buf.references()<CR>",opt)
  mapbuf("n","gr","<cmd>lspsaga lsp_finder<CR>",opt)
  -- diagnostic
  mapbuf("n","gp","<cmd>lspsaga show_line_diagnostics<CR>",opt)
  mapbuf("n","gj","<cmd>lspsaga diagnostic_jump_next<CR>",opt)
  mapbuf("n","gk","<cmd>lspsaga diagnostic_jump_prev<CR>",opt)
  mapbuf("n","<leader>f","<cmd>lua vim.lsp.buf.formatting()<CR>",opt)
end
-- nvim-cmp 自动补全按键映射
pluginKeys.cmp = function(cmp)
  return {
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i","c"}),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.confirmBehavior.Replace
    }),
    -- 如果弹窗内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i","c"}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i","c"}),
  }
end


return pluginKeys
