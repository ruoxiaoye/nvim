-- 如果找不到lualine插件就不继续执行了
local status,lualine = pcall(require,"lualine")
if not status then
  vim.notify("没有找到lualine")
  return
end

lualine.setup({
  -- 样式设置
  options = {
    theme = "tokyonight",   -- 主题
    component_separators = {
      left = "|",
      right = "|",
    }, -- 分段符
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = {
      llft = " ",
      right = " ",
    }, -- 组件分隔符
  },
  -- 扩展设置
  extensions = {"nvim-tree","toggleterm"},
  -- 不同分段显示内容设置
  sections = {
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " "},
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        -- symbols = {
        -- unix = '', --e712
        -- dos = '', --e70f
        -- mac = '', --e711
        -- },
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      "encoding",
      "filetype",
    },
  },
})

