-- :h mason-default-settings
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "→",
      package_uninstalled = "✘",
    },
  },
})
require("mason-lspconfig").setup({
  --确保安装、根据需要填写
  ensure_installed = {
    "lua_ls",
    "bashls",
    "clangd",
    "cmake",
  },
})

local lspconfig = require("lspconfig")

-- 安装列表
-- {key: 服务器路径名，value：配置文件}
-- key 必须为下列网址列出的server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  lua_ls = require("lsp.config.lua"),    --lua/lsp/config/lua.lua
  bashls = require("lsp.config.bash"),
  clangd = require("lsp.config.clang"),
  cmake = require("lsp.config.cmake"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现 on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end

