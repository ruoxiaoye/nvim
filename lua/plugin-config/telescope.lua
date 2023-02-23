local status, telescope = pcall(require, "telescope")
if not status then
    vim.notify("没有找到 telescope")
  return
end

telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认未insert，也可以是normal
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopelist,
  },
  pickers = {
    -- 内置pickers配置
    find_files = {
      -- 查找文件换皮肤，支持的参数有：diropdown, cursor, ivy
      -- theme = "dropdown"
    }
  },
  extensions = {
    --扩展插件配置
  },
})
-- telescope extensions
pcall(telescope.load_extension,"env")
