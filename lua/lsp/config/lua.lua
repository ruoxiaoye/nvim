-- lua语言服务配置
-- https://github.com/neovim/nvovim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local opts = {
  settings = {
    lua = {
      runtime = {
        -- 告诉language server你使用的lua版本 像：likely luaJIT
        version = "LuaJIT",
        -- 设置lua路径
        path = runtime_path,
      },
      diagnostics = {
        --获取language server以识别vim
        globals = { "vim" },
      },
      workspace = {
        -- 让服务器知道neovim运行时的文件
        library = vim.api.nvim_get_runtime_file("",true),
        checkThirdParty = false,
      },
      -- 不发送遥测数据
      telemetry = {
        enable =false,
      },
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门的插件处理
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr,...)
    end
    -- local function buf_set_option(...)
    -- vim.api.nvim_buf_set_option(bufnr,...)
    -- end
    -- 绑定按键
    require("keybindings").mapLSP(buf_set_keymap)
  end,
}

-- 查看目录等信息
-- print(vim.inspect(server))

return {
  on_setup = function(server)
    --opts = require("lua-dev").setup({ lspconfig = opts})
    server.setup(opts)
  end,
}

